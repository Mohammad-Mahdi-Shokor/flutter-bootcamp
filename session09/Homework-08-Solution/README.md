# Session 8 Homework — Solution: Shopping List

The solution to `session08/Homework`. The shopping list now uses Riverpod, has
a form to add items, and only accepts valid input.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Replace its `lib/` folder with the `lib/` folder from this solution.
3. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

**What changed since the homework starter**

`models/item.dart` and `Views/item_details.dart` are unchanged.

- `controllers/item_controller.dart` — NEW. `ItemController` holds the two
  starting items (private `_items` + getter) and `addItem()`, which only adds
  an item if the name is 2–20 characters and the quantity is 1–99.
- `controllers/app_controllers.dart` — NEW. `appcontainer` + `itemProvider`.
- `Views/shopping_page.dart` — `StatelessWidget` → `ConsumerWidget` that
  reads from `itemProvider`. New form on top: Name and Quantity `TextField`s
  and an "Add Item" button. The Quantity field opens the number keyboard and
  only accepts digits.
- `main.dart` — wrapped in `UncontrolledProviderScope`.

**What this practises**

The same steps as moving the To-Do app to Riverpod in session 8, plus
`keyboardType: TextInputType.number`,
`FilteringTextInputFormatter.digitsOnly`, and `int.tryParse`.
