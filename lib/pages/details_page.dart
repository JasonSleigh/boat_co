import 'package:boat_co/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: mainBlue,
            ),
          ),
          title: Text('Details'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout,
                  color: mainBlue,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: mainBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.arguments["title"],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "£" + Get.arguments["price"],
                      style: TextStyle(
                        color: Colors.green[200],
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      Get.arguments["description"],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                width: Get.width - 50,
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(Get.arguments["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart,
            color: mainBlue,
          ),
          backgroundColor: Colors.white,
        ));
  }
}
