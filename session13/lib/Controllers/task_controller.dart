// ===========================================================================
// task_controller.dart  —  CHANGED IN SESSION 13
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 12:
//   1. No more hard-coded tasks. Each user's tasks live in Firestore, one
//      document per task, in Users/{uid}/Tasks.
//   2. NEW: startListening() / stopListening(). The controller listens to
//      Firestore, rebuilds _tasks on every change, and calls
//      notifyListeners() in ONE place: inside the listener.
//   3. addTask / changeStatus / deleteTask only WRITE to Firestore. They
//      don't touch _tasks and don't call notifyListeners(): Firestore tells
//      the listener, and the listener updates the screen.
//
//      tap ✓ → updateDocument → snapshots() fires → _tasks rebuilt → screen
//
// The method names and the `index` parameter are the same as before, so
// TaskListPage and TaskTile did not change.
// The controller never uses FirebaseFirestore directly: only CRUDFirestore.
// ===========================================================================

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/firebase/crud_firestore.dart';

class TaskController extends ChangeNotifier {
  final CRUDFirestore _crud = CRUDFirestore();

  final List<Task> _tasks = []; // CHANGED: starts empty, filled by Firestore
  List<Task> get tasks => _tasks;

  // NEW: our "ticket" to the live stream. cancel() stops listening.
  StreamSubscription? _subscription;

  // NEW: Users/{uid}/Tasks for whoever is signed in.
  String get _path => 'Users/${FirebaseAuth.instance.currentUser!.uid}/Tasks';

  // NEW: called by ProviderAccount once someone is signed in.
  void startListening() {
    _subscription?.cancel(); // never listen twice
    _subscription = _crud.listenCollection(_path).listen((snap) {
      _tasks.clear();
      for (final doc in snap.docs) {
        _tasks.add(Task.fromMap(doc.data(), doc.id));
      }
      notifyListeners(); // the only notifyListeners() in this class
    });
  }

  // NEW: called by ProviderAccount before signing out.
  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
    _tasks.clear();
    notifyListeners();
  }

  // CHANGED: write to Firestore only.
  void changeStatus(int index) {
    final task = _tasks[index];
    _crud.updateDocument(_path, task.id!, {"status": !task.status!});
  }

  void addTask(String title, String note) {
    // length between 2 and 100
    if (title.length >= 2 &&
        title.length <= 20 &&
        note.length >= 2 &&
        note.length <= 100) {
      _crud.addDocument(
        _path,
        Task(title: title, note: note, status: false).toMap(),
      );
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _crud.deleteDocument(_path, _tasks[index].id!);
    }
  }
}
