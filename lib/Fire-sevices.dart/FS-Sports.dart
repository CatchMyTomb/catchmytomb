import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceSports {
  static final FirestoreServiceSports _firestoreService =
      FirestoreServiceSports._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceSports._internal();

  factory FirestoreServiceSports() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db.collection('Tombs/OccpEQD19eoOmrLfPaP0/Sport').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Tomb.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }
}
