import 'dart:io';

import 'package:catch_my_tomb/helpers/location_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FormTomb extends StatefulWidget {
  @override
  _FormTombState createState() => _FormTombState();
}

class _FormTombState extends State<FormTomb> {
  String _locationMessage = "";
  String _imageUrl;
  File _imageFile;
  final picker = ImagePicker();
  String _previewImageUrl;

  var storage = FirebaseStorage.instance;

  final firestoreInstance = FirebaseFirestore.instance;

  TextEditingController titleController = new TextEditingController();
  TextEditingController cemeteryController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      _showPreview(position.latitude, position.longitude);
    });
  }

  void _onPressed() {
    firestoreInstance.collection("NewTombs").add({
      "location": _locationMessage,
      "imageUrl": _imageFile.toString(),
      "title": titleController.text,
      "cemetery": cemeteryController.text,
    }).then((value) {
      print(value.id);
    });
  }

  void _storage() async {
    Reference ref = FirebaseStorage.instance.ref();
    TaskSnapshot addImg =
        await ref.child("tombImage/$_locationMessage").putFile(_imageFile);

    if (addImg == null) {
      print("added to Firebase Storage");
    }
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text(
        "Prenez en photo de la tombe trouvée",
        style: GoogleFonts.poiretOne(
          color: Colors.grey,
          fontSize: 12,
        ),
      );
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),
            child: Text(
              'Modifiez votre photo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
          TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(10)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black54)),
            child: Text(
              'Modifiez votre photo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    }
  }

  _getLocalImage() async {
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
    );

    if (imageFile != null) {
      setState(() {
        _imageFile = File(imageFile.path);
      });
    }
  }

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffffb838)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/slide3.png'),
              ),
              SizedBox(height: 16),
              Text(
                "Partagez avec nous votre découverte",
                textAlign: TextAlign.center,
                style: GoogleFonts.poiretOne(
                    color: Color(0xff2E2E2E),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _imageFile == null && _imageUrl == null
                  ? ButtonTheme(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffffb838))),
                        onPressed: () => _getLocalImage(),
                        child: Text(
                          'Prendre une photo',
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              _showImage(),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xfff1f1f1),
                  labelText: 'Tapez le nom de la personnalité',
                  labelStyle: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: cemeteryController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff1f1f1),
                  hoverColor: Colors.amber,
                  border: InputBorder.none,
                  labelText: 'Tapez le nom du cimetière',
                  labelStyle: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(_locationMessage),
              SizedBox(height: 20),
              Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              ),
              Text(
                "N'oubliez pas d'ajouter votre localisation en appuyant sur le bouton ci-dessous",
                style: GoogleFonts.raleway(
                  color: Colors.red,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    _getLocation();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffffb838))),
                  child: Text(
                    "Ajoutez votre localisation",
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 170,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: _previewImageUrl == null
                    ? Text(
                        "Vous n'avez pas encore partagé la localisation de la tombe trouvée",
                        textAlign: TextAlign.center,
                      )
                    : Image.network(
                        _previewImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.send,
            semanticLabel: 'envoyer',
          ),
          backgroundColor: Color(0xffffb838),
          onPressed: () {
            _onPressed();
            _storage();
            Navigator.pop(context);
          }),
    );
  }
}
