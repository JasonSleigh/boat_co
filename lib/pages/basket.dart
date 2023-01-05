import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/constants/exports.dart';
import 'package:boat_co/logic/total_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainBlue,
          ),
        ),
      ),
      body: Obx(() {
        if (basketList.value.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Basket is empty',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offNamed("/home");
                  },
                  child: Text('Go Shopping'))
            ],
          ));
        } else
          return ListView.builder(
            shrinkWrap: true,
            itemCount: basketList.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (_) {
                  if (basketList.value.length > 0) {
                    basketList.value.removeAt(index);
                  }
                },
                child: Card(
                  child: ListTile(
                    leading: Image(
                      height: 100,
                      width: 50,
                      image: NetworkImage(
                        basketList.value[index].image,
                      ),
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      basketList.value[index].title,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: (() {
                        if (basketList.value.length > 0) {
                          basketList.value.removeAt(index);
                        }
                      }),
                    ),
                  ),
                ),
              );
            },
          );
      }),
      bottomNavigationBar: Obx(() {
        return Visibility(
          visible: basketList.value.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'Total: £${totalPrice()}',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text("Pay Now"),
                    onPressed: () {
                      List<int> checkoutList = [];
                      for (int i = 0; i < basketList.value.length; i++) {
                        checkoutList.add(basketList.value[i].id);
                      }
                      orderController.checkOut(productIds: checkoutList);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      // bottomNavigationBar: Obx(
      //   () {
      //     return basketList.value.isNotEmpty
      //         ? Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal: 20,
      //               vertical: 20,
      //             ),
      //             child: ElevatedButton(
      //               child: Text("Pay Now"),
      //               onPressed: () {
      //                 List<int> checkoutList = [];
      //                 for (int i = 0; i < basketList.value.length; i++) {
      //                   checkoutList.add(basketList.value[i].id);
      //                 }
      //                 orderController.checkOut(productIds: checkoutList);
      //               },
      //             ))
      //         : Container();
      //   },
      // ),
    );
  }
}
