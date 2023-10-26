import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

String name = '안녕';
String description = '';

class _GoogleMapPageState extends State<GoogleMapPage> {
  // late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/logopoint2.png',
    );

    setState(
      () {
        // _markers.clear();
        for (final office in googleOffices.offices) {
          final marker = Marker(
            //터치시 어떻게 데이터를 보낼까?
            onTap: () {
              name = office.name;
              description = office.description;
            },
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lon),
            infoWindow: InfoWindow(
              title: office.name,
              snippet: office.description,
            ),
            icon: markerIcon,
          );
          _markers[office.name] = marker;
        }
      },
    );
  }

  Future<void> tapMarker(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();

    setState(() {
      for (final office in googleOffices.offices) {
        Marker(
          markerId: MarkerId(office.name),
          onTap: () {
            name = office.name;
            description = office.description;
          },
        );
      }
    });
  }
  // 데이터 정보 받기
  // Future<void> cafeinfo() async {
  //   final googleOffices = await locations.getGoogleOffices();

  //   setState(
  //     () {
  //       for (final office in googleOffices.offices) {}
  //     },
  //   );
  // }

  LatLng currentLocation = const LatLng(37.506932467450326, 127.05578661133796);

  @override
  Widget build(BuildContext context) {
    // bool isMove = false;
    return Stack(
      children: [
        Scaffold(
          body: GoogleMap(
            onTap: (argument) {},
            // onCameraIdle: () {
            //   // 카메라 이동이 멈춘 경우
            //   setState(() => isMove = false);
            // },
            // onCameraMoveStarted: () {
            //   // (사용자에 의해)카메라 이동이 시작된 경우
            //   setState(() => isMove = true);
            // },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 17,
            ),
            onMapCreated: _onMapCreated,
            markers: _markers.values.toSet(),
          ),
        ),
        _buildContainer(),
      ],
    );
  }
}

Widget _buildContainer() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes("https://ifh.cc/g/Zg7JDk.jpg", name, description),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
              "https://ifh.cc/g/Zg7JDk.jpg",
              name,
              description,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
              "https://ifh.cc/g/Zg7JDk.jpg",
              name,
              description,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _boxes(String image, String cafename, String cafedescription) {
  return GestureDetector(
    onTap: () {
      // _gotLocation(lat, lon);
    },
    child: Container(
      child: FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(24),
          shadowColor: const Color.fromARGB(128, 191, 191, 191),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 180,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: myDetailsContainer(name),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myDetailsContainer(String cafeName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          child: Text(
            cafeName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(height: 50),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: const Text(
                "3.0",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: const Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              ),
            ),
            Container(
              child: const Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              ),
            ),
            Container(
              child: const Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 5),
      Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "영업시간 무제한",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "음료 무제한",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
