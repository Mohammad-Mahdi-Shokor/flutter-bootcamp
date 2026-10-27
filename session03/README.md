# Session 03 — Lists and Navigation

This session covers two things: showing scrolling lists, and moving between
screens with named routes. Each one has its own demo in this project.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Replace the `lib/` folder in your project with the `lib/` folder from this session.
3. Run the following command in your terminal: `flutter pub get`

No extra dependencies this session, and no `assets/` folder (the session 2
images aren't used anymore).

- **List demo** (default): runs as is. `home` is `ItemsListView`.
- **Navigation demo**: in `main.dart`, comment out the `home:` line, then
  uncomment `initialRoute` and `routes`.

**What changed since session 2**

This is a fresh project, so the session 2 screens are not carried over.

- `views/items_list_view.dart` — NEW. The same five items shown twice: a
  `ListView` with every child written by hand, and a `ListView.builder`
  that builds each item from a list using `itemCount` and `itemBuilder`.
  Both are wrapped in `Expanded` so they fit inside a `Column`.
- `views/page1_view.dart` — NEW. Goes to Page 2 with
  `Navigator.pushNamed`.
- `views/page2_view.dart` — NEW. Goes back to Page 1 with
  `Navigator.pushNamedAndRemoveUntil`, which also clears the history so
  there's no back arrow. `pushNamed` and `pop` are left in the comments to
  compare.
- `main.dart` — `home` is now `ItemsListView`, and it has a commented-out
  `initialRoute` and `routes` map that name each page.

**What we learned**

`ListView` vs `ListView.builder` (`itemCount`, `itemBuilder`, `index`),
`Expanded`, `Padding`, named routes (`routes`, `initialRoute`), and the
navigation stack: `Navigator.pushNamed`, `Navigator.pop`, and
`Navigator.pushNamedAndRemoveUntil`.
