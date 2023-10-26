// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      // 받아온 json에 명시된 키값을 정확히 입력해줘야한다.
      name: json['CMPNM_NM'] ?? '',
      sigunNm: json['sigunNm'] ?? '',
      bsnTmNm: json['bsnTmNm'] ?? '',
      provsnProdlstNm: json['provsnProdlstNm'] ?? '',
      provsnTrgtNm2: json['provsnTrgtNm2'] ?? '',
      refineLotnoAddr: json['refineLotnoAddr'] ?? '',
      refineZipno: json['refineZipno'] ?? '',
      // String으로 lat, lon 값이 오기 때문에 doble로 변경해준다.
      lat: double.parse(json['REFINE_WGS84_LAT'] ?? '0'),
      lon: double.parse(json['REFINE_WGS84_LOGT'] ?? '0'),
      detailAddr: json['detailAddr'] ?? '',
      provsnTrgtNm1: json['provsnTrgtNm1'] ?? '',
      adress: json['REFINE_ROADNM_ADDR'] ?? '',
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'CMPNM_NM': instance.name,
      'sigunNm': instance.sigunNm,
      'bsnTmNm': instance.bsnTmNm,
      'provsnProdlstNm': instance.provsnProdlstNm,
      'provsnTrgtNm2': instance.provsnTrgtNm2,
      'refineLotnoAddr': instance.refineLotnoAddr,
      'refineZipno': instance.refineZipno,
      'REFINE_WGS84_LAT': instance.lat,
      'REFINE_WGS84_LOGT': instance.lon,
      'detailAddr': instance.detailAddr,
      'provsnTrgtNm1': instance.provsnTrgtNm1,
      'REFINE_ROADNM_ADDR': instance.adress,
    };
// openApi의 json 파일은 한겹 더 쌓아진 상태였으므로 row까지 접근해줘야한다.
Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      shops: (json['GGGOODINFLSTOREST'][1]['row'] as List<dynamic>)
          .map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'row': instance.shops,
    };
