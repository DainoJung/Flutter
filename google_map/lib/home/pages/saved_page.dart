import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildContainer();
  }
}

Widget _buildContainer() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
              "https://ifh.cc/g/Zg7JDk.jpg",
              37.506932467450326,
              127.05578661133796,
              "테라로사 포스코센터점",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
              "https://ifh.cc/g/Zg7JDk.jpg",
              37.506932467450326,
              127.05578661133796,
              "테라로사 포스코센터점",
            ),
          )
        ],
      ),
    ),
  );
}

Widget _boxes(String image, double lat, double lon, String cafename) {
  return GestureDetector(
    onTap: () {
      // _gotLocation(lat, lon);
    },
    child: Container(
      child: FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
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
                  child: myDetailsContainer(cafename),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myDetailsContainer(String cafeNme) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          child: Text(
            cafeNme,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: const Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: const Icon(
                Icons.ac_unit_outlined,
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
                Icons.ac_unit_outlined,
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
