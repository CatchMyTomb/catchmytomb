import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceAll {
  static final FirestoreServiceAll _firestoreService =
      FirestoreServiceAll._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceAll._internal();

  factory FirestoreServiceAll() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db.collection('AllTombs').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Tomb.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }
}
