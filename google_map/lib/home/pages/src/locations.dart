import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'locations.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lon,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lon;
}

@JsonSerializable()
class Region {
  Region({
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  final String name;
}

@JsonSerializable()
class Office {
  Office({
    required this.description,
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

  final String description;

  final double lat;
  final double lon;
  final String name;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.offices,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Office> offices;
}

Future<Locations> getGoogleOffices() async {
  // const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // // Retrieve the locations of Google offices
  // try {
  //   final response = await http.get(Uri.parse(googleLocationsURL));
  //   if (response.statusCode == 200) {
  //     return Locations.fromJson(json.decode(response.body));
  //   }
  // } catch (e) {
  //   print(e);
  // }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/nomadmap.json'),
    ),
  );
}
