// ===========================================================================
// task.dart  —  NEW FILE IN SESSION 07
// ---------------------------------------------------------------------------
// The model for one to-do item, built like Product in session 05.
//   title  -> e.g. "Call Mom"
//   note   -> extra details, e.g. "Wish her a happy weekend"
//   status -> true = done, false = not done
// The same Task model is used, unchanged, all the way to session 10.
// ===========================================================================

class Task {
  String? title;
  String? note;
  bool? status;
  Task({this.title, this.note, this.status});
}
