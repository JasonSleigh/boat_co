import 'package:boat_co/constants/controllers.dart';
import 'package:boat_co/constants/exports.dart';
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          child: Text("Pay Now"),
          onPressed: () {
           List<int> checkoutList = [];
            for(int i = 0; i < basketList.value.length; i++){
              checkoutList.add(basketList.value[i].id);
            }
            orderController.checkOut(productIds: checkoutList);
          },
        ),
      ),
    );
  }
}
