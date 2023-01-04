import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packages/export_packages.dart';

import '../../constants/colors.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateALogin(
      hardPassword: true,
      passwordCheck: false,
      isForgottenPassword: false,
      spaceUnderImage: 50,
      showEye: true,
      imageHeight: 150,
      imageWidth: 150,
      image: mainLogo,
      formKey: _formKey,
      autoValidate: true,
      emailController: authController.emailController,
      passwordController: authController.passwordController,
      loginButtonColor: mainBlue,
      loginButtonPress: () {
        if (_formKey.currentState!.validate()) {
          authController.login();
        } else {
          Get.snackbar("Form Error", "Please fill out the form correctly");
        }
      },
    );
  }
}
