import 'package:catch_my_tomb/Screens/AddTombScreen.dart';
import 'package:catch_my_tomb/Screens/allMapscreen.dart';
import 'package:catch_my_tomb/Widgets/Actors-tombs.dart';
import 'package:catch_my_tomb/Widgets/Historics-tombs.dart';
import 'package:catch_my_tomb/Widgets/Sports-tombs.dart';
import 'package:catch_my_tomb/Widgets/famous-tomb.dart';

import 'package:catch_my_tomb/Widgets/iconlist.dart';
import 'package:catch_my_tomb/Widgets/politic-tombs.dart';
import 'package:catch_my_tomb/Widgets/singer-tombs.dart';
import 'package:catch_my_tomb/Widgets/writing-tombs.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 50.0),
                  child: Text(
                    'Où repose en paix vos célébrités favorites ?',
                    style: GoogleFonts.poiretOne(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2E2E2E)),
                  ),
                ),
                Container(padding: EdgeInsets.all(30), child: IconsList()),
                SizedBox(height: 20.0),
                FamousTombs(),
                SizedBox(height: 20.0),
                SingerTombs(),
                SizedBox(height: 20.0),
                WritersTomb(),
                SizedBox(height: 20.0),
                ActorsTomb(),
                SizedBox(height: 20.0),
                PoliticsTombs(),
                SizedBox(height: 20.0),
                SportsTomb(),
                SizedBox(height: 20.0),
                HistoricsTombs(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Color(0xffffb838),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FormTomb(),
                  ),
                ),
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Color(0xffffb838),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewMap(),
                  ),
                ),
                child: Icon(FontAwesomeIcons.mapMarkedAlt),
              )
            ],
          ),
        ));
  }
}
