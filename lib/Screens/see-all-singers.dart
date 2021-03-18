import 'package:catch_my_tomb/Fire-sevices.dart/FS-Singer.dart';
import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:catch_my_tomb/Screens/DetailScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllSingers extends StatefulWidget {
  @override
  _SeeAllSingersState createState() => _SeeAllSingersState();
}

class _SeeAllSingersState extends State<SeeAllSingers> {
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
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xffffb838)),
          title: Text(
            'Musique',
            style: GoogleFonts.poiretOne(
              color: Color(0xffffb838),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirestoreServiceSinger().getNotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Tomb>> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                          width: 300,
                          child: Text(
                            'Retrouvez ceux qui ont marqué le monde de la musique',
                            style: GoogleFonts.poiretOne(
                              color: Color(0xff2E2E2E),
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                  Container(
                    height: 460,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          Tomb tomb = snapshot.data[index];
                          {
                            return new Container(
                              margin: EdgeInsets.all(10.0),
                              width: 210.0,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Positioned(
                                    bottom: 15.0,
                                    child: Container(
                                      height: 120.0,
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              tomb.city,
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                            Text(
                                              tomb.cemetery,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NoteDetailsPage(
                                          tomb: tomb,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 2.0),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Container(
                                                height: 180.0,
                                                width: 180.0,
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: tomb.imageUrl)),
                                          ),
                                          Positioned(
                                            left: 10.0,
                                            bottom: 10.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.star,
                                                      size: 10.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5.0),
                                                    Text(
                                                      tomb.title,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                  )
                ],
              );
            },
          ),
        ));
  }
}
