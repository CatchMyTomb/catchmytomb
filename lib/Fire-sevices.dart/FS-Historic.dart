import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceHistorics {
  static final FirestoreServiceHistorics _firestoreService =
      FirestoreServiceHistorics._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceHistorics._internal();

  factory FirestoreServiceHistorics() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db
        .collection('Tombs/OccpEQD19eoOmrLfPaP0/HommesHistoire')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Tomb.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }
}
