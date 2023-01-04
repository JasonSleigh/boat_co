import 'package:badges/badges.dart';
import 'package:boat_co/constants/colors.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ListingModel.dart';

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
            Obx(() {
              return basketList.value.length > 0
                  ? Badge(
                      position: BadgePosition.topStart(top: 0, start: 0),
                      badgeContent: Text(
                        basketList.value.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed("basket");
                          },
                          icon: Icon(
                            Icons.shopping_cart_checkout,
                            color: mainBlue,
                          )),
                    )
                  : IconButton(
                      onPressed: () {
                        Get.toNamed("basket");
                      },
                      icon: Icon(
                        Icons.shopping_cart_checkout,
                        color: mainBlue,
                      ),
                    );
            }),
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
                      "£" + Get.arguments["price"].toString(),
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
          onPressed: () {
            RxBool isThere = false.obs;
            for (var i = 0; i < basketList.value.length; i++) {
              if (basketList.value[i].id == Get.arguments["id"]) {
                Get.snackbar("Product Added",
                    "You already have this product in your shopping cart");
                isThere.toggle();
              }
            }
            if (isThere.value == false) {
              basketList.value.add(ListingModel(
                id: Get.arguments["id"],
                title: Get.arguments["title"],
                price: Get.arguments["price"],
                description: Get.arguments["description"],
                image: Get.arguments["image"],
                lat: Get.arguments["lat"],
                lng: Get.arguments["lng"],
                owner: Get.arguments["ownerName"],
                ownerEmail: Get.arguments["ownerEmail"],
                ownerPhone: Get.arguments["ownerPhone"],
              ));
            }
          },
          child: Icon(
            Icons.shopping_cart,
            color: mainBlue,
          ),
          backgroundColor: Colors.white,
        ));
  }
}
