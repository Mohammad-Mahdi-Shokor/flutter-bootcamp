# Session 12 Homework: Save Everything in Firebase

Right now the app only saves your email. The names are always `null`, and the
tasks disappear when you close the app. Let's fix that.

Keep working on your session 12 project.

## Part 1: Your name

- Add **First name** and **Last name** fields to the register form, and save
  them with the user when they register.
- On the profile, show `Hello, <first name>!` above the email.

## Part 2: Your tasks

Save the tasks inside the user's document, as a list:

```
Users/{uid}
  email: "..."
  tasks: [ {title, note, status}, {title, note, status}, ... ]
```

- Add `toMap()` and `fromMap()` to `Task`, like `UserProvider` has.
- In `TaskController`, add a `saveTasks()` method that saves the whole list
  to `Users/{uid}` with `setDocument`. Call it after you add, tick or delete a
  task.
- After signing in, read the list back with `getDocument` and fill `_tasks`.
- Remove the three hard-coded tasks.

Hint: you get the uid with `FirebaseAuth.instance.currentUser!.uid`.

## Part 3: Explore (pick one)

Pick one part of Firebase we didn't cover, read about it, and try it if you
can. For example: Google sign-in, email verification, security rules, push
notifications, Remote Config, or Firebase Hosting. Start here:
https://firebase.google.com/docs/flutter

Some features need the paid Blaze plan. Don't add a card; just read about
those.
