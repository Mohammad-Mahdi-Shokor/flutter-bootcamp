import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/quote.dart';
import 'apimodel.dart';

class QuoteAPI {
  static final QuoteAPI _singleton = QuoteAPI._internal();

  factory QuoteAPI() => _singleton;

  QuoteAPI._internal();

  static const String _randomQuotePath = '/quotes/random';

  Future<QuoteModel?> fetchRandomQuote() async {
    final result = await APISModel().get(
      baseUrl: "https://dummyjson.com",
      path: '/quotes/random',
    );
    if (result == null) return null;

    try {
      final map = jsonDecode(result) as Map<String, dynamic>;
      return QuoteModel.fromMapToQuote(map);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
