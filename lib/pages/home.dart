import 'package:boat_co/constants/colors.dart';
import 'package:boat_co/dummyData/boat_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: mainBlue,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: mainBlue,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: boatImages.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: InkWell(
                  onTap: () {
                    var args = {
                      "title": boatImages[index].title,
                      "price": boatImages[index].price,
                      "image": boatImages[index].ownerImage,
                      "description": boatImages[index].description,
                    };
                    Get.toNamed("/detailsPage", arguments: args);
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(boatImages[index].ownerImage),
                          height: 100,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: " + boatImages[index].title,
                            ),
                            Text(
                              "Price: £" + boatImages[index].price,
                            ),
                            Text(
                              "Location: " +
                                  boatImages[index].location +
                                  " miles away",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
