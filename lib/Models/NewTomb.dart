import 'package:cloud_firestore/cloud_firestore.dart';

class Tomb {
  String id;
  String title;
  String cemetery;
  String city;
  String country;
  String imageUrl;
  String description;
  String infoUrl;
  GeoPoint location;
  String imageTomb;

  Tomb(
      this.id,
      this.title,
      this.cemetery,
      this.city,
      this.country,
      this.imageUrl,
      this.infoUrl,
      this.description,
      this.location,
      this.imageTomb);

  Tomb.fromMap(Map<String, dynamic> data, String id)
      : title = data["title"],
        cemetery = data["cemetery"],
        city = data["city"],
        country = data["country"],
        imageUrl = data["imageUrl"],
        description = data['description'],
        infoUrl = data['infoUrl'],
        location = data['location'],
        imageTomb = data['imageTomb'],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "cemetery": cemetery,
      "country": country,
      "imageUrl": imageUrl,
      "city": city,
      "description": description,
      "infoUrl": infoUrl,
      "location": location,
      "imageTomb": imageTomb,
    };
  }
}
