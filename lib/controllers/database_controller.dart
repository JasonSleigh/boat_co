import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:boat_co/models/ListingModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  var productsList = RxList<ListingModel>().obs;

  RxBool isLoading = false.obs;

  final url = Uri.parse(baseUrl + "products");

  Map<String, String> appHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application',
    'Authorization': "Bearer $accessToken"
  };

  getAllProducts() async {
    isLoading.toggle();

    var getUrl = Uri.parse(baseUrl + "allProducts");

    Map<String, String> getHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(getUrl, headers: getHeaders);
    var jsonData = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          isLoading.toggle();
          productsList.value.clear();
          for (Map<String, dynamic> item in jsonData['products']) {
            productsList.value.add(ListingModel.fromJson(item));
          }
          productsList.refresh();
          break;
        default:
          Get.snackbar(
            "Error ${response.statusCode}:",
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // update product
  updateProduct() async {
    isLoading.toggle();
    final response = await http.put(url, headers: appHeaders);
    var jsonData = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          isLoading.toggle();
          for (Map<String, dynamic> item in jsonData['products']) {
            productsList.value.add(ListingModel.fromJson(item));
          }
          break;
        default:
          Get.snackbar(
            "Error ${response.statusCode}:",
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // delete product
  deleteProduct() async {
    isLoading.toggle();
    final response = await http.delete(url, headers: appHeaders);
    var jsonData = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          isLoading.toggle();
          for (Map<String, dynamic> item in jsonData['products']) {
            productsList.value.add(ListingModel.fromJson(item));
          }
          break;
        default:
          Get.snackbar(
            "Error ${response.statusCode}:",
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // create product

  createProduct() async {
    isLoading.toggle();
    final response = await http.post(url, headers: appHeaders);
    var jsonData = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          isLoading.toggle();
          for (Map<String, dynamic> item in jsonData['products']) {
            productsList.value.add(ListingModel.fromJson(item));
          }
          break;
        default:
          Get.snackbar(
            "Error ${response.statusCode}:",
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
