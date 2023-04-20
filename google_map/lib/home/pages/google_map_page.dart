import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};

  static const LatLng currentLocation =
      LatLng(37.506932467450326, 127.05578661133796);
  static const LatLng destination =
      LatLng(37.507032467450326, 127.05580661133796);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: currentLocation,
          zoom: 17,
        ),
        onMapCreated: (controller) {
          mapController = controller;
          addMarker('test', destination);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/logo.png',
    );

    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: '나이로비',
        snippet: '멋쟁이사자 스타트업 오피스입니다.',
      ),
      icon: markerIcon,
    );

    _markers[id] = marker;
    setState(() {});
  }
}
