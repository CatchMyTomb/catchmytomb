import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServicePolitics {
  static final FirestoreServicePolitics _firestoreService =
      FirestoreServicePolitics._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServicePolitics._internal();

  factory FirestoreServicePolitics() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db
        .collection('Tombs/OccpEQD19eoOmrLfPaP0/Hommes politique')
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
