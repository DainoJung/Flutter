import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map/home/pages/blog_page.dart';
import 'package:google_map/home/pages/google_map_page.dart';
import 'package:google_map/home/pages/profile_page.dart';
import 'package:google_map/home/pages/saved_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final status = await Geolocator.checkPermission();
  if (status == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navermap",
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  // 선택된 페이지의 인덱스 넘버 초기화
  final List<Widget> _widgetOptions = <Widget>[
    const GoogleMapPage(),
    const SavedPage(),
    const BlogPage(),
    const ProfilePage(),
  ];
  // 3개의 페이지를 연결할 예정이므로 3개의 페이지를 여기서 지정해준다. 탭 레이아웃은 3개.
  void _onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Nomadmap",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.lightGreen,

        backgroundColor: Colors.white,
        onTap: _onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }
}
