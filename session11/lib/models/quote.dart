// ===========================================================================
// quote.dart  —  NEW FILE IN SESSION 10
// ---------------------------------------------------------------------------
// This model exists only because session 10 introduces a REST API call.
// When we GET https://dummyjson.com/quotes/random the server answers with
// JSON text, e.g.:   { "id": 5, "quote": "....", "author": "...." }
// We never pass that raw JSON around the app. Instead we convert it ONCE,
// at the edge, into this typed Dart object so the rest of the UI works with
// `quote.quote` / `quote.author` instead of map["quote"].
// ===========================================================================

import 'package:flutter/widgets.dart'; // only needed for debugPrint() below

class QuoteModel {
  // The two fields are `final`: a fetched quote never changes after creation.
  final String quote;
  final String author;

  QuoteModel({required this.quote, required this.author});

  // Small debug helper — prints the quote to the console. Handy while teaching
  // to prove the data actually arrived. Not used by the UI.
  void printQuote() {
    debugPrint(quote);
  }

  // ---- The important part of this file --------------------------------------
  // A `factory` constructor that builds a QuoteModel from a decoded JSON map.
  //   map["quote"]   -> the quote text from the server
  //   ?.toString()   -> defend against a non-String value
  //   ?? ""          -> if the key is missing / null, fall back to a safe value
  // This keeps the UI from ever crashing on a weird or empty response field.
  factory QuoteModel.fromMapToQuote(Map<String, dynamic> map) => QuoteModel(
    quote: map["quote"]?.toString() ?? "",
    author: map["author"]?.toString() ?? "unknown",
  );
}
