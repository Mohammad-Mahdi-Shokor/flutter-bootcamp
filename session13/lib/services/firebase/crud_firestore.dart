// ===========================================================================
// crud_firestore.dart  —  CHANGED IN SESSION 13
// ---------------------------------------------------------------------------
// Our wrapper around Firestore, like Services is around http (session 11).
// Only this file talks to FirebaseFirestore; controllers call these methods.
//
// WHAT CHANGED vs session 12 (setDocument and getDocument are the same):
//   • listenCollection()  NEW: a Stream that gives the whole collection
//                         again every time something in it changes
//   • addDocument()       NEW: a new document with an id Firestore makes up
//   • updateDocument()    NEW: change only some fields of one document
//   • deleteDocument()    NEW: remove one document
//
// `path` can be a nested path written as a string, like 'Users/abc123/Tasks'.
// ===========================================================================

import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDFirestore {
  FirebaseFirestore get _db => FirebaseFirestore.instance;

  // Create or update one document. merge: true keeps the fields we don't send.
  Future<void> setDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collection).doc(id).set(data, SetOptions(merge: true));
  }

  // Read one document once. null if it doesn't exist.
  Future<Map<String, dynamic>?> getDocument(String collection, String id) async {
    final snap = await _db.collection(collection).doc(id).get();
    if (!snap.exists) return null;
    return snap.data();
  }

  // NEW: listen to a collection, oldest first.
  // get() asks once; snapshots() keeps telling us about every change.
  Stream<QuerySnapshot<Map<String, dynamic>>> listenCollection(String path) {
    return _db.collection(path).orderBy('createdAt').snapshots();
  }

  // NEW: add a document with a random id, and the time it was created.
  Future<void> addDocument(String path, Map<String, dynamic> data) async {
    await _db.collection(path).add({
      ...data,
      'createdAt': FieldValue.serverTimestamp(), // Firebase fills in the time
    });
  }

  // NEW: change only the fields in `data`, keep the others.
  Future<void> updateDocument(
    String path,
    String id,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(path).doc(id).update(data);
  }

  // NEW: delete one document.
  Future<void> deleteDocument(String path, String id) async {
    await _db.collection(path).doc(id).delete();
  }
}
