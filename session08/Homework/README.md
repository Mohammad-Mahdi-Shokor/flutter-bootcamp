# Session 8 Homework: Shopping List

This app already works: it shows a list of items, and tapping an item opens its details page.
But the items are hardcoded, and you can't add new ones. Your job is to fix that.

## Project Setup

1. Create a new Flutter project.
2. Replace its `lib/` folder with the `lib/` folder from this homework.
3. Run the app once to make sure it works.
4. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
5. Run `flutter pub get`.

## Tasks

### 1. Take input
- Add two `TextField`s at the top of `ShoppingPage`: **Name** and **Quantity**.
- Give each one its own `TextEditingController`.
- The Quantity field must open the **number keyboard** only.
- Add an **Add** button under them.

### 2. Riverpod 
- Create a `controllers/` folder.
- Create a controller class that extends `ChangeNotifier`. It holds the list of items (move the 2 hardcoded items there) and has an `addItem(String name, String quantityText)` method.
- Create a provider for your controller.
- Connect Riverpod to the app in `main.dart`.
- Turn `ShoppingPage` into a `ConsumerWidget` and read the items from the provider.
- When the **Add** button is pressed, call `addItem` with the text from the two fields.

### 3. Validation
Only add the item if:

| Field    | Rule                                                  |
| -------- | ----------------------------------------------------- |
| Name     | 2 to 20 characters                                    |
| Quantity | a whole number from 1 to 99 (hint: `int.tryParse`)    |

## Make sure that:   

- [ ] The 2 starting items still show in the list.
- [ ] A valid item appears in the list right after pressing **Add**.
- [ ] An invalid item (name `"A"`, or quantity `"0"` or `"abc"`) is **not** added.
- [ ] The Quantity field opens the number keyboard.
- [ ] Tapping any item, including new ones, opens its details page.

