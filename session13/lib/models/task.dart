// ===========================================================================
// task.dart  —  CHANGED IN SESSION 13
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 12:
//   1. NEW: `id`, the Firestore document id of this task. From now on we
//      change and delete a task by its id.
//   2. NEW: toMap() to save a task, and fromMap() to read it back, the same
//      way UserProvider does. The id is NOT inside the map: Firestore keeps
//      it as the document's name, so fromMap() receives it separately.
// ===========================================================================

class Task {
  String? id; // NEW: the document id in Users/{uid}/Tasks/{id}
  String? title;
  String? note;
  bool? status;

  Task({this.id, this.title, this.note, this.status});

  // NEW: Task -> Map, to save it in Firestore.
  Map<String, dynamic> toMap() {
    return {"title": title, "note": note, "status": status};
  }

  // NEW: Map (from Firestore) -> Task.
  factory Task.fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map["title"],
      note: map["note"],
      status: map["status"] ?? false,
    );
  }
}
