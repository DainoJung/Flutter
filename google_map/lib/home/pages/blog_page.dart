import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  const BodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  Widget column = Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.computer),
            title: Text("Flow 9"),
            subtitle: Text("공부하기 좋은 카페"),
          ),
        )
      ],
    ),
  );

  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              column,
            ],
          ),
        ),
      );
    },
  );
}
