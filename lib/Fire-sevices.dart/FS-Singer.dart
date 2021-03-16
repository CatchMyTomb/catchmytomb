import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceSinger {
  static final FirestoreServiceSinger _firestoreService =
      FirestoreServiceSinger._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceSinger._internal();

  factory FirestoreServiceSinger() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db
        .collection('Tombs/OccpEQD19eoOmrLfPaP0/Chanteur')
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
