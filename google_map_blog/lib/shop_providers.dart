import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_map_blog/shop.dart';
import 'package:http/http.dart' as http;

class ShopProviders {
  Uri uri = Uri.parse(
      "https://openapi.gg.go.kr/GGGOODINFLSTOREST?KEY=cc48d9b9f4b54a3887d5dce0f80a9027&Type=json&pIndex=1&pSize=1000");
  Future<List<Shop>> getShop() async {
    List<Shop> shop = [];

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      debugPrint(
          '제발~~~~~~~ : ${jsonDecode(response.body)['GGGOODINFLSTOREST'][1]['row']}');
      shop = jsonDecode(response.body)['GGGOODINFLSTOREST'][1]['row']
          .map<Shop>((row) {
        return Shop.fromMap(row);
      }).toList();
    }
    return shop;
  }
}
