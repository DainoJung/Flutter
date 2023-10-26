import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

part 'shopdata.g.dart';

@JsonSerializable()
class Shop {
  Shop({
    required this.name, // 가게 이름
    required this.sigunNm,
    required this.bsnTmNm,
    required this.provsnProdlstNm,
    required this.provsnTrgtNm2,
    required this.refineLotnoAddr,
    required this.refineZipno,
    required this.lat, // 가게 위도
    required this.lon, // 가게 경도
    required this.detailAddr,
    required this.provsnTrgtNm1,
    required this.adress,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);

  final String name;
  final String sigunNm;
  final String bsnTmNm;
  final String provsnProdlstNm;
  final String provsnTrgtNm2;
  final String refineLotnoAddr;
  final String refineZipno;
  final double lat;
  final double lon;
  final String detailAddr;
  final String provsnTrgtNm1;
  final String adress;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.shops,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Shop> shops;
}

Future<Locations> fetchShops() async {
  const url =
      'https://openapi.gg.go.kr/GGGOODINFLSTOREST?KEY=fe1900a2f97b485cb3f61a0368d4baf4&Type=json&pSize=1000';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Locations.fromJson(json.decode(response.body));
    }
  } catch (e) {
    print(e);
  }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/shopdata.json'),
    ),
  );
}
