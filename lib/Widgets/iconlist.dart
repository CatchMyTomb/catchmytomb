import 'package:catch_my_tomb/Screens/see-all-actors.dart';
import 'package:catch_my_tomb/Screens/see-all-historics.dart';
import 'package:catch_my_tomb/Screens/see-all-politics.dart';
import 'package:catch_my_tomb/Screens/see-all-singers.dart';
import 'package:catch_my_tomb/Screens/see-all-writers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:catch_my_tomb/presentation/my_flutter_app_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class IconsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        IconButton(
          icon: Icon(MyFlutterApp.music_1),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeeAllSingers(),
            ),
          ),
          iconSize: 60,
        ),
        IconButton(
          icon: Icon(MyFlutterApp.cinema_1),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeeAllActors(),
            ),
          ),
          iconSize: 60,
        ),
        IconButton(
          icon: Icon(MyFlutterApp.book),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeeAllWriters(),
            ),
          ),
          iconSize: 60,
        ),
        IconButton(
          icon: Icon(MyFlutterApp.politics_1),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeeAllPolitics(),
            ),
          ),
          iconSize: 60,
        ),
        IconButton(
          icon: Icon(MyFlutterApp.historic_1),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeeAllHistorics(),
            ),
          ),
          iconSize: 60,
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xffffffff)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
              )),
          onPressed: () {
            launch(
                "http://catchmytomb.fr/politique-de-confidentialite-pour-lapplication-mobile-catch-my-tomb");
          },
          child: Text(
            'Politique de confidentialité ',
            style: GoogleFonts.raleway(
                color: Color(0xFF5E5B54),
                fontSize: 12,
                textStyle: TextStyle(height: 1.7)),
          ),
        ),
      ]),
    );
  }
}
