class RequestModel {
  String url = "";
  Map<String, String> headers = {};
  Map<String, dynamic> body = {};

  RequestModel({String baseUrl = ""}) {
    url = baseUrl;
    headers.putIfAbsent('Accept', () => 'application/json');
  }
  void withContentType() {
    headers.putIfAbsent("Content-Type", () => 'application/json');
  }
}
