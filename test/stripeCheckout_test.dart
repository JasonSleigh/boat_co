import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  var url = baseUrl + "checkout";

  var newUrl = Uri.parse(url);

  Map<String, String> appHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  var body = jsonEncode({
    "products" : [1, 2],
  });

  var response = await http.post(newUrl, headers: appHeaders, body: body);

  var jsonResponse = jsonDecode(response.body);

  group('testing the checkout endpoint', () {
    test('Test for 200', () {
      int responseCode = response.statusCode;
      print(jsonResponse);
      expect(responseCode, 200);
    });
  });
}
