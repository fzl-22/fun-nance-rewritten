import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  final String _baseUrl = "http://10.219.49.95:3000";

  Future<http.Response> get(
      {required String path, required String params}) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/$path/$params"));

      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<http.Response> post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/$path"),
        headers: {"Content-Type": "application/json", "charset": "utf-8"},
        body: jsonEncode(body),
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
