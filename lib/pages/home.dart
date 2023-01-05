import 'package:boat_co/constants/colors.dart';
import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:boat_co/logic/recall_database.dart';
import 'package:boat_co/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static var data = products.productsList.value;

  @override
  Widget build(BuildContext context) {
    recallData();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomAppBar(title: "Home",),
      ),
      body: Obx(
        () {
          if (data.length == 0) {
            return Center(
              child: Lottie.asset(
                boatAnimation,
                height: 200,
              ),
            );
          }

          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (products.isLoading == true) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: mainBlue,
                    ),
                  );
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        var args = {
                          'id': data[index].id,
                          "title": data[index].title,
                          "price": data[index].price,
                          "image": data[index].image,
                          "description": data[index].description,
                          'lat': data[index].lat,
                          'lng': data[index].lng,
                          'ownerName': data[index].owner,
                          'ownerEmail': data[index].ownerEmail,
                          'ownerPhone': data[index].ownerPhone,
                        };
                        Get.toNamed("/detailsPage", arguments: args);
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(data[index].image),
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
                                  "Name: " + data[index].title,
                                ),
                                Text(
                                  "Price: £" + data[index].price.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              });
        },
      ),
    );
  }
}
