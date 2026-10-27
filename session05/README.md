# Session 05 — Models and Passing Data Between Screens

This session finishes moving the app to Riverpod (the items page) and
introduces models: a `Product` class, a products list, and a details page
that receives the tapped product.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Replace the `lib/` folder in your project with the `lib/` folder from this session.
3. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

**What changed since session 4**

`counter.dart` and `counter_controller.dart` are unchanged.

- `Controllers/items_Controller.dart` — NEW. `ItemsController` holds the
  items and the selected index; `selectIndex()` replaces `setState()`.
- `Controllers/app_controllers.dart` — added `itemsProvider`.
- `Views/items_screen.dart` — NEW, replaces session 4's `itemsPage.dart`
  (deleted). Same screen as a `ConsumerWidget`, so the selection is kept when
  you come back to the page.
- `models/product.dart` — NEW. Our first model: name, description, price.
- `Views/productsScreen.dart` — NEW. A `ListView.builder` of products shown
  with `ListTile`. Tapping one opens its details with `Navigator.push` +
  `MaterialPageRoute`. A `pushNamed` + `arguments` version is left in the
  comments.
- `Views/productDetails.dart` — NEW. Receives the `Product` through its
  constructor.
- `Views/home.dart` — added a "Go to products page" button.
- `main.dart` — `/items` now opens `ItemsScreen`, plus two new routes:
  `/products` and `/productsDetails` (reads its `Product` from the route
  arguments).

**What we learned**

Moving a `StatefulWidget` to Riverpod, model classes and nullable fields,
`ListTile`, and two ways to pass data to a screen: through its constructor
(`Navigator.push` + `MaterialPageRoute`) and through route arguments
(`pushNamed` + `arguments` + `ModalRoute.of(context).settings.arguments`).
