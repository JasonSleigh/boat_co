import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RxBool isLoading = false.obs;

  Map<String, String> appHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $accessToken"
  };

  // login
  login() async {
    isLoading.toggle();
    final url = Uri.parse(baseUrl + "login");

    Map<String, String> loginHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var body = jsonEncode({
      "email": emailController.text,
      "password": passwordController.text,
    });

    final response = await http.post(url, headers: loginHeaders, body: body);

    var jsonResponse = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          isLoading.toggle();
          accessToken = jsonResponse['access_token'];
          Get.offAllNamed('/home');
          break;
        case 401:
          break;
        default:
          Get.snackbar(
            'Error ${response.statusCode}',
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }


  // register
  register() async {
    isLoading.toggle();
    final url = Uri.parse(baseUrl + "register");

    var body = jsonEncode({
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    final response = await http.post(url, headers: appHeaders, body: body);

    var jsonResponse = jsonDecode(response.body);

    try {
      switch (response.statusCode) {
        case 201:
          isLoading.toggle();
          accessToken = jsonResponse['access_token'];
          Get.offAllNamed('/home');
          break;
        case 401:
          break;
        default:
          Get.snackbar(
            'Error ${response.statusCode}',
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }

// logout 
  logout() async {
    final url = Uri.parse(baseUrl + "logout");

    final response = await http.post(url, headers: appHeaders);

    try {
      switch (response.statusCode) {
        case 200:
          Get.offAllNamed('/login');
          break;
        case 401:
          break;
        default:
          Get.snackbar(
            'Error ${response.statusCode}',
            response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // delete account
  deleteAccount() async {
    final url = Uri.parse(baseUrl + "delete");

    final response = await http.delete(url, headers: appHeaders);

    try {
      switch (response.statusCode) {
        case 200:
          Get.offAllNamed('/login');
          break;
        case 401:
          break;
        default:
          Get.snackbar(
            'Error ${response.statusCode}',
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
