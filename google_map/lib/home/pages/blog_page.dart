import 'package:flutter/material.dart';
import 'package:google_map/home/pages/google_map_page.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BlogDetail(),
    );
  }
}

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                "넓고 잔잔한 테라로사커피 포스코점",
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
        padding: const EdgeInsets.all(15),
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24),
            shadowColor: const Color.fromARGB(128, 191, 191, 191),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: 300,
                    height: 180,
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
                  ),
                ],
              ),
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
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: const Icon(
                      Icons.chat,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    child: const Text(
                      "324",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "208",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.file_upload_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
