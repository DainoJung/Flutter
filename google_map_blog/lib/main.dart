import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/shopdata.dart' as shopdata;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LatLng _center = const LatLng(37.566535, 126.9779692);

  // 기본적인 json 파싱 방법

  // final Set<Marker> markers = {};
  // ShopProviders shopProviders = ShopProviders();
  // Future<void> _onMapCreated(GoogleMapController controller) async {
  //   final shopData = await shopProviders.getShop();
  //   setState(() {
  //     for (final shop in shopData) {
  //       final marker = Marker(
  //         markerId: MarkerId(shop.name),
  //         position: LatLng(shop.lat, shop.lon),
  //         infoWindow: InfoWindow(
  //           title: shop.name,
  //           snippet: shop.adress,
  //         ),
  //       );
  //       markers.add(marker);
  //       debugPrint("디버그!!!!!!!!!!!!! : $marker");
  //     }
  //   });
  // }

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final shopProvider = await shopdata.fetchShops();
    setState(() {
      _markers.clear();
      for (final shop in shopProvider.shops) {
        final marker = Marker(
          markerId: MarkerId(shop.name),
          position: LatLng(shop.lat, shop.lon),
          infoWindow: InfoWindow(
            title: shop.name,
            snippet: shop.adress,
          ),
        );
        // null 값이 있었던 경우 마커 생성 X
        if (shop.name != '' &&
            shop.lat != 0 &&
            shop.lon != 0 &&
            shop.adress != '') {
          _markers[shop.name] = marker;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 5.0,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
