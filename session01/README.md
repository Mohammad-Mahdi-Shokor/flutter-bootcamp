# Session 01 — Your First Flutter Screen

This session is our first look at Flutter. Everything on the screen is a
widget, and we build a small layout by putting widgets inside each other: a
page with an app bar, a floating button, and a body made of colored boxes.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Replace the `lib/` folder in your project with the `lib/` folder from this session.
3. Run the following command in your terminal: `flutter pub get`

No extra dependencies this session.

**What changed in the project**

We started from the default `flutter create` template and deleted its counter demo.

- `main.dart` — REWRITTEN. Only the minimum is left: `main()` calls
  `runApp()`, `MyApp` returns a `MaterialApp`, and `home` is `HomeView`.
- `views/home_view.dart` — NEW. A `Scaffold` with an `AppBar`, a
  `FloatingActionButton`, and a body of nested `Container`s styled with
  `BoxDecoration` (color, border, rounded corners). The commented-out body
  at the bottom is the 3×3 grid we built first with one `Column` and three
  `Row`s. Swap it in to run it again.

**What we learned**

`main()` and `runApp()`, `StatelessWidget` and `build()`, `MaterialApp`,
`Scaffold`, `AppBar`, `FloatingActionButton`, `Center`, `Container`,
`BoxDecoration` (and why `color:` and `decoration:` can't be used together),
`Row`, `Column`, and `mainAxisAlignment` vs `crossAxisAlignment`.
