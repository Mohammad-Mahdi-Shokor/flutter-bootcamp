# Session 10 — Calling a REST API

This session connects the app to the internet. We fetch a random quote from a
public REST API (`https://dummyjson.com/quotes/random`) and show it in a banner
above the task list.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` folder to your project directory.
3. Add the `flutter_riverpod` and `http` dependencies to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

**What changed since session 9**

- `models/quote.dart` — NEW. Model for a quote, with a `fromMapToQuote()`
  factory that converts the server's JSON into a Dart object.
- `Views/TaskList_page.dart` — now a `ConsumerStatefulWidget`. Added
  `fetchQuote()` (GET → check status code → `jsonDecode` → `QuoteModel`) and a
  banner that shows a loading spinner, the quote, or an error.
- `main.dart` — imports `quote.dart` and points `/tasks` at the renamed
  `TaskListPage`.

**What we learned**

`async`/`await`, the `http` package, HTTP status codes, turning JSON into a
model with a `fromMap` factory, and driving the UI from loading / error /
success state.
