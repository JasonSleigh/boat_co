import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = baseUrl + "login";

  final newUrl = Uri.parse(url);

  Map<String, String> appHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  var body = jsonEncode({
    "email": "test@example.com",
    "password": "password",
  });

  final response = await http.post(newUrl, headers: appHeaders, body: body);

  var jsonData = jsonDecode(response.body);

  group('Authentication', () {
    test('Test for 200', () {
      int responseCode = response.statusCode;
      // print(jsonData['access_token']);
      print(response.body);
      expect(responseCode, 200);
    });
  });
}
