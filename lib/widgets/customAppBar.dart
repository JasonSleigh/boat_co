import 'package:badges/badges.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: mainBlue,
        ),
      ),
      title: Text(title),
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
    );
  }
}
