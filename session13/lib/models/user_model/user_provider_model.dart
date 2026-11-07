// ===========================================================================
// user_provider_model.dart  —  NEW FILE IN SESSION 12
// ---------------------------------------------------------------------------
// The signed-in user, as OUR app stores it.
//
// Firebase Authentication only keeps login info (uid, email, password).
// Anything else we want to remember about a user goes into our own document
// in Firestore, at Users/{uid}. This model is that document in Dart.
//
// Like QuoteModel it has fromMap() (map -> object, when we READ the user).
// New this time: toMap() (object -> map), because now WE send data to the
// server.
// ===========================================================================

class UserProvider {
  UserProvider({
    required this.uid, // Firebase always gives us a uid
    this.firstName, // the rest may be missing, so they are nullable
    this.lastName,
    this.email,
    this.creationTime,
  });

  String uid;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? creationTime;

  // Firestore map -> Dart object (when we READ the user)
  factory UserProvider.fromMap(Map<String, dynamic> map) {
    return UserProvider(
      uid: map["uid"] ?? "",
      firstName: map["firstName"],
      lastName: map["lastName"],
      email: map["email"],
      // We saved the date as text (see toMap), so we turn it back here.
      creationTime: map["creationTime"] != null
          ? DateTime.tryParse(map["creationTime"].toString())
          : null,
    );
  }

  // Dart object -> Firestore map (when we SAVE the user)
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      // A DateTime can't be saved as it is: toIso8601String() turns it into
      // text like "2026-10-28T19:10:00.000". DateTime.tryParse reads it back.
      "creationTime": creationTime?.toIso8601String(),
    };
  }
}
