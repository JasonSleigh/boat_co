import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController {
  checkOut({
    required String name,
    required String image,
    required int price,
  }) async {
    var url = baseUrl + "products/checkout";

    var newUrl = Uri.parse(url);

    Map<String, String> appHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var body = jsonEncode({
      "name": name,
      "images": image,
      "unit_amount": price,
    });

    var response = await http.post(newUrl, headers: appHeaders, body: body);

    var jsonResponse = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          //TODO: send them to stripe

          break;
        default:
          Get.snackbar("Error ${response.statusCode}", jsonResponse["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // success

  // webhook

  // cancel
}
