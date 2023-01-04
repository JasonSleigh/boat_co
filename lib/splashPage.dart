import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      products.getAllProducts();
      Get.offAllNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                "Welcome To Boat Co",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Center(
              child: Image(
                image: mainLogo,
                height: 200,
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Lottie.asset(
                boatAnimation,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
