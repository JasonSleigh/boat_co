import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:packages/export_packages.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateARegistration(
      hasImageUpload: false,
      autoValidate: true,
      nameController: authController.nameController,
      
    );
  }
}