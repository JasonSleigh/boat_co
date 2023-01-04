import 'dart:convert';

import 'package:boat_co/constants/exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart'as http;

void main() async {
group("Add products to database", () {
    final productUrl = baseUrl + "products";

    final newProductUrl = Uri.parse(productUrl);

    Map<String, String> authAppHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer 1|p19iKfNOonEHe1RPE3VjXQ487IsYU4IX0f0CHuOi"
    };

    test("Create first listing", () async {
      var body = jsonEncode({
        "title": "John Wick's boat",
        "description":
            "This is a massive boat, some people call it a ship, I call it home away from home",
        "price": 19000,
        "lat": 50.36640,
        "lng": -4.16216,
        "image":
            "https://images.pexels.com/photos/5421315/pexels-photo-5421315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "owners_name": "John Wick",
        "owners_email": "johnw@gmail.com",
        "owners_phone": "07867885656",
      });
      final response = await http.post(newProductUrl, headers: authAppHeaders, body: body);
      expect(response.statusCode, 201);
    });

    test("create second product", () async {
      var body = jsonEncode({
        "title": "blue Boat",
        "description":
            "This is a blue boat, some think it looks purple at night but I know it's rely just blue",
        "price": 8000,
        "lat": 50.36640,
        "lng": -4.16216,
        "image":
            "https://imgs.search.brave.com/bw4XQOZUowYkr1VielS4RteD1YRB1UBx8YLuVz0lOMg/rs:fit:711:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5w/YXdaRTFIZC1ia05y/WWdoaHE1STl3SGFF/OCZwaWQ9QXBp",
        "owners_name": "Micky Mouse",
        "owners_email": "m.mouse@gmail.com",
        "owners_phone": "07867885454"
      });
      final response = await http.post(newProductUrl, headers: authAppHeaders, body: body);
      expect(response.statusCode, 201);
    });

     test("create third product", () async {
      var body = jsonEncode({
        "title": "Fishing Boat",
        "description":
            "My mom bought me a fishing boat but I don't rely like fishing so I am selling it",
        "price": 15000,
        "lat": 50.36640,
        "lng": -4.16216,
        "image":
            "https://imgs.search.brave.com/G7CZksEXkxURJsX0yTO4QiUkxwLyTn1uGXfMP-GslY8/rs:fit:722:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC44/TGpad3ZEeklJZ29N/YWg5S2daNE1nSGFF/MyZwaWQ9QXBp",
        "owners_name": "Jack Black",
        "owners_email": "jackBlack@gmail.com",
        "owners_phone": "07867885858"
      });
      final response = await http.post(newProductUrl, headers: authAppHeaders, body: body);
      expect(response.statusCode, 201);
    });
  });
}