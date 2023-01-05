import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  var url = baseUrl + "products/checkout";

  var newUrl = Uri.parse(url);

  Map<String, String> appHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  var body = jsonEncode({
    "name": "Test boat",
    "images":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5seIrE-yM7DthUpAYAEki9pyeFEPjV041nDVFqr44I9iu3qN5nE8yaPvbCkI1G2xH5lk&usqp=CAU",
    "unit_amount": "18000",
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
