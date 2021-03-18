import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:catch_my_tomb/Screens/Map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteDetailsPage extends StatefulWidget {
  final Tomb tomb;

  const NoteDetailsPage({Key key, @required this.tomb}) : super(key: key);
  @override
  _NoteDetailsPageState createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.tomb.title, style: TextStyle(color: Color(0xffffb838))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xffffb838)),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Container(
                child: CachedNetworkImage(
                    fit: BoxFit.cover, imageUrl: widget.tomb.imageUrl)),
          ),
        ),
        SizedBox(height: 10),
        IconButton(
            icon: Icon(
              Icons.location_on,
              semanticLabel: 'Visiter le lieu',
            ),
            iconSize: 40,
            color: Color(0xffffb838),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MapScreen(
                    tomb: widget.tomb,
                  ),
                ))),
        Text(
          'Visitez le lieu',
          style: GoogleFonts.raleway(fontSize: 10, color: Color(0xffffb838)),
        ),
        SizedBox(height: 10),
        SizedBox(height: 25.0),
        Text(widget.tomb.title,
            style: GoogleFonts.poiretOne(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff7d7d7d))),
        SizedBox(height: 20),
        Text(widget.tomb.cemetery,
            style: GoogleFonts.raleway(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: Color(0xffffb838))),
        SizedBox(width: 3.0),
        Text(widget.tomb.city,
            style: GoogleFonts.raleway(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5E5B54))),
        SizedBox(width: 3.0),
        Text(widget.tomb.country,
            style: GoogleFonts.sourceSansPro(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFFC2C0B6))),
        SizedBox(height: 25),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(7),
                child: Text(
                  widget.tomb.description,
                  style: GoogleFonts.raleway(
                      color: Color(0xFF5E5B54),
                      fontSize: 16,
                      textStyle: TextStyle(height: 1.7)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffffffff)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                    )),
                onPressed: () {
                  launch(widget.tomb.infoUrl);
                },
                child: Text(
                  'Wikipédia',
                  style: GoogleFonts.raleway(
                      color: Color(0xFF5E5B54),
                      fontSize: 16,
                      textStyle: TextStyle(height: 1.7)),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    'Photo de la tombe de \n'
                    ' ${widget.tomb.title}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.muli(
                        fontSize: 25.0, fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 20),
              widget.tomb.imageTomb != null
                  ? Container(
                      height: 300,
                      width: 200.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xfff1f1f1),
                          offset: Offset(1.0, 3.0),
                          blurRadius: 8.0,
                        ),
                      ], borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.tomb.imageTomb),
                        ),
                      ))
                  : Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Nous n'avons pas encore de photo à vous présenter",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(color: Color(0xFFC2C0B6)),
                      ),
                    ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ])),
    );
  }
}
