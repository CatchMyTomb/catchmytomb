import 'dart:async';

import 'package:catch_my_tomb/Fire-sevices.dart/FS-Actors.dart';

import 'package:catch_my_tomb/Models/NewTomb.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final Tomb tomb;

  const MapScreen({Key key, this.tomb}) : super(key: key);
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

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
    return new Scaffold(
        body: StreamBuilder(
            stream: FirestoreServiceActors().getNotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Tomb>> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("");
              }

              return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.tomb.location.latitude,
                        widget.tomb.location.longitude),
                    zoom: 14.4746,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('tomb'),
                      position: LatLng(widget.tomb.location.latitude,
                          widget.tomb.location.longitude),
                      infoWindow: InfoWindow(
                        title: widget.tomb.title,
                        snippet: widget.tomb.cemetery,
                      ),
                    )
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  });
            }));
  }
}
