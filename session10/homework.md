# Session 10 Homework: Get a New Quote

Right now the app grabs one quote when you open the Tasks screen, and that's it.
There's no way to get a new one, and if that first request fails the error just
sits there and never goes away. Your job is to fix both.

## Project Setup

You already have the session 10 app, so just keep working on it. 

1. Open your session 10 project (the one with the quote at the top, already in `/lib`).
2. Check that `flutter_riverpod` and `http` are in your `pubspec.yaml`, then run `flutter pub get`.
3. Run it once and make sure a quote shows up.

Everything you need to touch is in `lib/Views/TaskList_page.dart`.

## Tasks

### 1. Add a refresh button
- Put an `IconButton` with `Icons.refresh` in the `AppBar`.
- When it's tapped, call `fetchQuote()`.
- Tap it a few times. You should get a different quote each time.

### 2. Clear the old state before each request
- At the top of `fetchQuote()`, inside the first `setState`, set `error = null`
  and `quote = null`.
- Do this one first. Without it, once a request fails the error never clears,
  so tasks 1 and 3 won't really work.

### 3. Add a Retry button when it fails
- In the error part of the banner (the red text), add a button under the
  message that calls `fetchQuote()`.
- To see the error on purpose, break the URL for a second (like
  `/quotes/randomXYZ`), check that the error and the Retry button show up, then
  put it back.

## Stretch (optional)
Pick a different thing to fetch from `https://dummyjson.com`, for example
`GET /recipes/1`. Make your own small model with a `fromMap`, do the whole
GET, status check, `jsonDecode`, model yourself, and show one field on screen
(like the recipe name). If you can do this without looking at the quote code,
you've got it.

## Make sure that:

- [ ] A quote still loads by itself when the screen opens.
- [ ] The refresh button gets a new quote every time.
- [ ] The spinner shows while a quote is loading.
- [ ] When a request fails, you see the error and a Retry button.
- [ ] After a failure, Retry or refresh can still load a quote and the error disappears.
