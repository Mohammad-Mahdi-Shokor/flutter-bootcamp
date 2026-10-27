# Session 02 — Images and State

This session adds images, sizes widgets relative to the screen, and makes the
screen respond to a tap. We build the same counter twice: once as a
`StatelessWidget`, where the screen never updates, and once as a
`StatefulWidget` with `setState()`, where it does.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` and `assets/` folders to your project directory.
3. Register the images in your `pubspec.yaml`, under the `flutter:` section:

   ```yaml
   flutter:
     uses-material-design: true
     assets:
       - assets/image1.jpeg
       - assets/image2.jpeg
       - assets/image3.jpeg
       - assets/image4.jpeg
   ```

4. Run the following command in your terminal: `flutter pub get`

To run a different screen, change the `home:` line in `main.dart`.

**What changed since session 1**

- `views/home_view.dart` — CHANGED. The nested boxes are gone. The box is
  now sized with `MediaQuery` (50% of the screen width, 20% of the height)
  and shows `assets/image2.jpeg` clipped to a circle (`DecorationImage` +
  `BoxShape.circle`). `Image.network` and `Image.asset` versions are left in
  the comments.
- `views/todo.dart` — NEW. A static to-do card: a `Row` holding a round
  "checkbox" and a `Column` with a title and description.
- `views/counter2_view.dart` — NEW. A counter as a `StatelessWidget`. The
  console shows the number going up, but the screen stays at 0.
- `views/counter_view.dart` — NEW. The same counter as a `StatefulWidget`.
  `setState()` rebuilds the screen, so the number updates.
- `main.dart` — imports the four screens and sets `home` to
  `Counter2View`. The other screens are listed in the comments.
- `pubspec.yaml` — the `assets:` list above.
- `assets/` — NEW folder with `image1.jpeg`–`image4.jpeg`.

**What we learned**

`MediaQuery`, `Image.asset` / `Image.network`, `AssetImage` +
`DecorationImage`, `BoxFit`, `BoxShape.circle`, declaring assets in
`pubspec.yaml`, `GestureDetector` + `onTap`, `StatelessWidget` vs
`StatefulWidget`, and `setState()`.
