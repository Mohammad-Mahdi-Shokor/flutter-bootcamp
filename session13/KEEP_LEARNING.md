# Keep Learning

That's the end of the bootcamp. You went from a blue box on the screen to an
app with sign-in, an API and a live database. That's a real app.

The best way to keep going is to **build something of your own**. Pick an
idea, get stuck, look things up. Below is what's worth learning next, roughly
in the order I'd go.

## 1. Build your own project

Some ideas that use everything we did, plus one new thing each:

- **Expense tracker**: tasks become expenses with an amount and a category.
  New: charts (`fl_chart`) and totals.
- **Habit tracker**: tick a habit every day. New: dates and streaks.
- **Recipe app**: recipes from an API like `https://dummyjson.com/recipes`,
  favorites saved in Firestore. New: images and a search bar.
- **Group chat**: messages in Firestore with `snapshots()`. New: sorting and
  showing who sent what.

Put it on GitHub. Your own project is worth more than any certificate.

## 2. Flutter things we didn't cover

| Topic | Why it's worth it | Search for |
| --- | --- | --- |
| Forms and validation | `Form` + `TextFormField` check input for you | "flutter form validation" |
| Themes and dark mode | One place for colors and fonts, plus dark mode | "flutter ThemeData dark mode" |
| Responsive layouts | Look good on phones, tablets and the web | `LayoutBuilder`, `MediaQuery` |
| Animations | Make the app feel alive | `AnimatedContainer`, "implicit animations" |
| Saving data on the phone | Settings and offline data without Firebase | `shared_preferences`, `hive` |
| Navigation packages | Cleaner routes, deep links on the web | `go_router` |
| Testing | Make sure changes don't break old features | "flutter widget test" |
| Publishing | Get your app on Google Play | "flutter build appbundle" |

## 3. Go deeper with what you know

- **Riverpod**: we used `ChangeNotifierProvider`, the older style. Look at
  `Notifier`, `AsyncNotifier` and `StreamProvider`. `StreamProvider` fits
  session 13's live tasks perfectly. Docs: https://riverpod.dev
- **Dart**: async and Streams in more depth, `extension` methods, and
  records. Take the Dart tour: https://dart.dev/language
- **Clean code**: we split the code into models, services, controllers and
  views. Read about "clean architecture flutter" and the repository pattern
  to take that further.

## 4. More Firebase

| Feature | What it does |
| --- | --- |
| Google sign-in | "Sign in with Google" instead of a password |
| Email verification and password reset | `sendEmailVerification()`, `sendPasswordResetEmail()` |
| Firestore queries | `where`, `orderBy`, `limit`, for example "only tasks not done" |
| Cloud Storage | Upload photos and files (needs the paid Blaze plan) |
| Cloud Messaging | Push notifications |
| Remote Config | Change texts or colors without publishing an update |
| Cloud Functions | Your own code running on Google's servers (needs Blaze) |
| Hosting | Put your Flutter web app online with `firebase deploy` |
| Analytics and Crashlytics | See how people use the app, and get crash reports |

Start here: https://firebase.google.com/docs/flutter

## 5. Where to look things up

- Flutter docs: https://docs.flutter.dev
- Packages: https://pub.dev (check the likes, the popularity and when it was last updated)
- Flutter on YouTube: the "Widget of the Week" videos are short and good
- Codelabs (step-by-step tutorials): https://docs.flutter.dev/codelabs
- When you're stuck: read the error message to the end, then search it.
  Most of the time, someone already asked.

Good luck, and keep building.
