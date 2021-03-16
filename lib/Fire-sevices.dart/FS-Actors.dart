import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceActors {
  static final FirestoreServiceActors _firestoreService =
      FirestoreServiceActors._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceActors._internal();

  factory FirestoreServiceActors() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db.collection('Tombs/OccpEQD19eoOmrLfPaP0/Acteurs').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Tomb.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }
}
