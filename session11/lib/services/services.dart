import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:session_11/services/request.dart';

class Services {
  static final Services _singleton = Services._internal();

  factory Services() => _singleton;

  Services._internal();
  Future<http.Response?> get({
    required String baseUrl,
    required String path,
  }) async {
    final request = RequestModel(baseUrl: baseUrl);
    request.url = "${request.url}$path";
    try {
      final url = Uri.parse(request.url);
      return await http // forgot to add return in session
          .get(url, headers: request.headers)
          .timeout(Duration(seconds: 15));
    } catch (e) {
      debugPrint("Request Error: $e");
      return null;
    }
  }
}
