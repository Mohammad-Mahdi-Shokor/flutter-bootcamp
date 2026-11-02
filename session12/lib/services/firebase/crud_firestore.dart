// ===========================================================================
// crud_firestore.dart  —  NEW FILE IN SESSION 12
// ---------------------------------------------------------------------------
// Our small wrapper around Firestore, the same idea as Services is around
// http: the rest of the app talks to THIS class, never to Firebase directly.
//
// How Firestore stores data:
//   Users               <- a COLLECTION (a folder of documents)
//    └─ abc123          <- a DOCUMENT (one record, its id = the user's uid)
//        ├─ email: ...  <- FIELDS (key + value, like a Map)
//        └─ uid: ...
//
// Today we only need two things: write one document, read one document.
// Next session adds add / update / delete for the tasks.
// ===========================================================================

import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDFirestore {
  // Firebase's own singleton, like our Services().
  FirebaseFirestore get _db => FirebaseFirestore.instance;

  // Write a document with OUR id (create it, or update it).
  // merge: true -> update the fields we send, keep the others.
  Future<void> setDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collection).doc(id).set(data, SetOptions(merge: true));
  }

  // Read one document as a Map, or null if it doesn't exist.
  Future<Map<String, dynamic>?> getDocument(String collection, String id) async {
    final snap = await _db.collection(collection).doc(id).get();
    if (!snap.exists) return null;
    return snap.data();
  }
}
