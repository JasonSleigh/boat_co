import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class OrderController {
  checkOut({
    required List<int> productIds,
  }) async {
    var url = baseUrl + "checkout";

    var newUrl = Uri.parse(url);

    Map<String, String> appHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var body = jsonEncode({"products": productIds});

    var response = await http.post(newUrl, headers: appHeaders, body: body);

    var jsonResponse = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          launchUrl(Uri.parse(jsonResponse["session_url"])).then((value) => Get.offAllNamed('/home'));
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
