import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'services.dart';

class APISModel {
  Services? _services;

  static final APISModel _singleton = APISModel._internal();

  factory APISModel() {
    _singleton.setServices();
    return _singleton;
  }

  Services setServices() => _services = Services();

  APISModel._internal();

  String? manipulateResponse(http.Response response, {bool withDecode = true}) {
    debugPrint('statusCode: ${response.statusCode}');
    if (withDecode) {
      debugPrint('response body: ${response.body}');
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      default:
        debugPrint('Error: ${response.statusCode}');
    }
    return null;
  }

  Future<String?> get({required String baseUrl, required String path}) async {
    final response = await _services!.get(baseUrl: baseUrl, path: path);
    if (response == null) return null;

    return manipulateResponse(response);
  }
}
