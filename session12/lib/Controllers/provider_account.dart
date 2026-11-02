// ===========================================================================
// provider_account.dart  —  NEW FILE IN SESSION 12
// ---------------------------------------------------------------------------
// The account controller: who is signed in.
//
// Same shape as our other controllers (TaskController): private data,
// getters, and notifyListeners() when something changes.
//
// What it does:
//   • register / sign in with email + password (Firebase Authentication)
//   • after that, load the user's document from Firestore, or create it the
//     first time (Users/{uid})
//   • restoreSession(): keep the user signed in after the app restarts
//   • signOut()
//
// The uid links the two:  Auth user abc123  <->  Firestore Users/abc123
// ===========================================================================

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model/user_provider_model.dart';
import '../services/firebase/crud_firestore.dart';

class ProviderAccount extends ChangeNotifier {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  final CRUDFirestore _crud = CRUDFirestore();

  UserProvider? _user; // null = nobody signed in
  bool _isBusy = false; // true while signing in (like `loading` for the quote)

  UserProvider? get user => _user;
  bool get isBusy => _isBusy;
  bool get isUserSignedIn => _user != null; // the whole UI switches on this

  // ---- sign in / register --------------------------------------------------
  // Firebase does the hard part (checking the password, creating the
  // account). We only call it.
  Future<void> signIn(BuildContext context, String email, String password) {
    return _run(context, () {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    });
  }

  Future<void> register(BuildContext context, String email, String password) {
    return _run(context, () {
      // After creating the account, Firebase signs the user in automatically.
      return _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  // Shared by both: spinner on -> do it -> load the user -> show errors ->
  // spinner off. `action` is a FUNCTION passed as a parameter, the same idea
  // as the VoidCallback we pass to Task_Tile.
  Future<void> _run(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    try {
      _isBusy = true;
      notifyListeners();

      await action();
      await _loadOrCreateUser();
    } catch (e) {
      // Wrong password, weak password, email already used... all arrive here.
      // Firebase messages look like "[firebase_auth/weak-password] Password
      // should be at least 6 characters": split('] ').last keeps the readable
      // part.
      //
      // context.mounted: after an `await`, the screen may be gone. Always
      // check before using context.
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().split('] ').last)),
        );
      }
    } finally {
      // finally runs whether it worked or failed, so the spinner always stops.
      _isBusy = false;
      notifyListeners();
    }
  }

  // ---- our own copy of the user in Firestore: Users/{uid} -----------------
  Future<void> _loadOrCreateUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return;

    final map = await _crud.getDocument("Users", firebaseUser.uid);

    if (map != null) {
      // Returning user: read the document.
      _user = UserProvider.fromMap(map);
    } else {
      // First sign-in: build the user from what Firebase knows and save it.
      _user = UserProvider(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        creationTime: firebaseUser.metadata.creationTime,
      );
      await _crud.setDocument("Users", firebaseUser.uid, _user!.toMap());
    }
    notifyListeners(); // HomePage rebuilds and shows the profile
  }

  // ---- stay signed in after a restart --------------------------------------
  // Firebase remembers who signed in on this device, but our _user lives in
  // memory and is empty after a restart. This loads it back. Called in
  // main() before runApp().
  Future<void> restoreSession() async {
    await _loadOrCreateUser();
  }

  // ---- sign out --------------------------------------------------------------
  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners(); // HomePage rebuilds and shows the login form
  }
}
