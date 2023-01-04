import 'package:boat_co/constants/controllers.dart';

recallData(){
  var data = products.productsList.value;
  if (data.length == 0) {
      products.getAllProducts();
    }
}