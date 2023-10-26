import 'package:flutter/material.dart';
import 'package:google_map_blog/shop.dart';
import 'package:google_map_blog/shop_providers.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Shop> shop = [];
  bool isLoading = true;
  ShopProviders shopProvider = ShopProviders();

  Future initShop() async {
    shop = await shopProvider.getShop();
  }

  @override
  void initState() {
    super.initState();
    initShop().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("가게 http")),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: shop.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Text(shop[index].name),
                        Text("${shop[index].lat}"),
                        Text("${shop[index].lon}"),
                        Text(shop[index].adress),
                      ],
                    ),
                  );
                }));
  }
}
