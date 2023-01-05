 import 'package:boat_co/constants/exports.dart';

totalPrice() {
            double total = 0;
            for (int i = 0; i < basketList.value.length; i++) {
              total += basketList.value[i].price;
            }
            return total;
          }