import 'package:catch_my_tomb/Models/NewTomb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceWritters {
  static final FirestoreServiceWritters _firestoreService =
      FirestoreServiceWritters._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreServiceWritters._internal();

  factory FirestoreServiceWritters() {
    return _firestoreService;
  }

  Stream<List<Tomb>> getNotes() {
    return _db
        .collection('Tombs/OccpEQD19eoOmrLfPaP0/ Litterature')
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
