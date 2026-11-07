# Session 13 — Live Tasks and Security Rules

This is the last session. The tasks finally live in Firestore: every task is
its own document in `Users/{uid}/Tasks`, the app listens to Firestore, and the
list updates by itself, even on another device. We also lock the database
with security rules, so each user can only read and write their own data.

When you're done, check out [KEEP_LEARNING.md](KEEP_LEARNING.md) for where to
go from here.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` folder to your project directory.
3. Add the dependencies:
   `flutter pub add flutter_riverpod http firebase_core firebase_auth cloud_firestore`
4. Run the following command in your terminal: `flutter pub get`
5. Connect your Firebase project like in session 12:
   `flutterfire configure --project=YOUR-PROJECT-ID --platforms=web,android`
   (the `lib/firebase_options.dart` here is only a placeholder).
6. In the console, open **Firestore Database → Rules**, paste the contents of
   [`firestore.rules`](firestore.rules), and click **Publish**.
7. Run the app: `flutter run -d chrome`, or on an Android emulator/phone.

To check that it works: sign in and add a task. A document appears in
**Firestore → Users → {your uid} → Tasks**. Change its `status` in the
console and watch the app tick it by itself.

**What changed since session 12**

The pages, `TaskTile`, the quote and the `services/` http layer are unchanged.

- `models/task.dart` — added `id` (the Firestore document id), `toMap()` and
  `fromMap(map, id)`.
- `services/firebase/crud_firestore.dart` — four new methods:
  `listenCollection()` (a live Stream), `addDocument()`, `updateDocument()`
  and `deleteDocument()`. Still the only file that talks to Firestore.
- `Controllers/task_controller.dart` — no more hard-coded tasks.
  `startListening()` / `stopListening()` follow the user's `Tasks`.
  `addTask`, `changeStatus` and `deleteTask` only write to Firestore; the
  listener updates `_tasks` and calls `notifyListeners()`.
- `Controllers/provider_account.dart` — starts listening after sign-in,
  register and restore, and stops before sign-out.
- `firestore.rules` — NEW. Only a signed-in user can read and write
  `Users/{their uid}` and everything inside it.

**What we learned**

`get()` (ask once) vs `snapshots()` (listen), Streams and
`StreamSubscription`, subcollections, `add` / `update` / `delete`, writing to
the database and letting the listener update the screen,
`FieldValue.serverTimestamp()`, and Firestore security rules with
`request.auth`.

**Common problems**

| What you see | Fix |
| --- | --- |
| `permission-denied` after publishing the rules | Check the path spelling (`Users`, not `users`), and that you're signed in |
| `permission-denied` right after signing out | `stopListening()` must run before `signOut()` |
| New tasks don't show up | `startListening()` was never called |
| Every task shows up twice | `startListening()` ran twice without `cancel()` |
| A new task jumps a little when added | Normal: the server fills in `createdAt` a moment later |
| `Null check operator` on `currentUser!` | The controller was used before anyone signed in |****
