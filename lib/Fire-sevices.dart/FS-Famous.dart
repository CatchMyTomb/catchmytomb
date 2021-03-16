import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceFamous {
  static final FirestoreServiceFamous _firestoreService =
      FirestoreServiceFamous._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceFamous._internal();

  factory FirestoreServiceFamous() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db
        .collection('Tombs/OccpEQD19eoOmrLfPaP0/Lesplusconnus')
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
