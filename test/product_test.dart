import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = baseUrl + "allProducts";

  final newUrl = Uri.parse(url);

  Map<String, String> appHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer 3|bs9WdWrGEtSs5LdgJeTFZykmevcAhwMYBOHJOarg"
  };

  final response = await http.get(newUrl, headers: appHeaders);

  var jsonData = jsonDecode(response.body);

  group('Testing the products section', () {
    test('Test for 200', () {
      int responseCode = response.statusCode;
      print(response.body);

      expect(responseCode, 200);
    });

    test("to get the data from the body", () {
      print(jsonData['products']);
      expect(jsonData['products'], isNotNull);
    });
    test("test the individual type", () {
      var data = jsonData['products'][0];
      checkId() {
        if (data['id'].runtimeType == int) {
          return true;
        } else
          return false;
      }

      expect(checkId(), true,
          reason: "ID expected int but got ${jsonData['id'].runtimeType}}");

      checkTitle() {
        if (data['title'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkTitle(), true,
          reason:
              "Title expected String but got ${jsonData['title'].runtimeType}}");

      checkDescription() {
        if (data['description'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkDescription(), true,
          reason:
              "Description expected String but got ${jsonData['description'].runtimeType}}");

      checkPrice() {
        if (data['price'].runtimeType == int) {
          return true;
        } else
          return false;
      }

      expect(checkPrice(), true,
          reason:
              "Price expected int but got ${jsonData['price'].runtimeType}}");

      print("Lat:" + data['lat'].runtimeType.toString());

      checkLat() {
        if (data['lat'].runtimeType == double) {
          return true;
        } else
          return false;
      }

      expect(checkLat(), true,
          reason:
              "Lat expected double but got ${jsonData['lat'].runtimeType}}");

      checkLng() {
        if (data['lng'].runtimeType == double) {
          return true;
        } else
          return false;
      }

      ;
      expect(checkLng(), true,
          reason:
              "Lng expected double but got ${jsonData['lng'].runtimeType}}");

      checkImage() {
        if (data['image'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkImage(), true,
          reason:
              "Image expected String but got ${jsonData['image'].runtimeType}}");

      checkOwnersName() {
        if (data['owners_name'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkOwnersName(), true,
          reason:
              "Owner Name expected String but got ${jsonData['owner_name'].runtimeType}}");

      checkOwnersEmail() {
        if (data['owners_email'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkOwnersEmail(), true,
          reason:
              "Owner Email expected String but got ${jsonData['owner_email'].runtimeType}}");
      checkOwnersNumber() {
        if (data['owners_phone'].runtimeType == String) {
          return true;
        } else
          return false;
      }

      expect(checkOwnersNumber(), true,
          reason:
              "Owner Phone expected String but got ${jsonData['owner_phone'].runtimeType}}");
    });
  });
}
