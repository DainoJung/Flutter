class Shop {
  late String name;
  late double lat;
  late double lon;
  late String adress;

  Shop({
    required this.name,
    required this.lat,
    required this.lon,
    required this.adress,
  });

  Shop.fromMap(Map<String, dynamic>? map) {
    // debugPrint('야아아ㅏㅏㅏㅏ : ${map?['REFINE_WGS84_LAT']}');
    name = map?['CMPNM_NM'] ?? '';
    lat = double.parse(map?['REFINE_WGS84_LAT'] ?? '0');
    lon = double.parse(map?['REFINE_WGS84_LOGT'] ?? '0');
    adress = map?['REFINE_ROADNM_ADDR'] ?? '';
  }

  // Shop.froJson(Map<String, dynamic>? json)
  //     : name = json?['CMPNM_NM'] ?? '',
  //       lat = json?['REFINE_WGS84_LAT' as Double] ?? 0,
  //       lon = json?['REFINE_WGS84_LOGT' as Double] ?? 0,
  //       adress = json?['REFINE_ROADNM_ADDR'] ?? '';
}
