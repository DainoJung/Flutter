import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String _name = "Dain Jung";
  final String _job = "Engineer";
  final String _detail = "Flutter Developing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(_job, style: const TextStyle(fontSize: 18)),
                      Text(_detail, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("50"), Text("Posts")],
                ),
              ),
              Container(height: 50, width: 2, color: Colors.grey),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("10"), Text("Likes")],
                ),
              ),
              Container(height: 50, width: 2, color: Colors.grey),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("3"), Text("Shares")],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  height: 50,
                  width: 180,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Follow",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 180,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Message",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: TabBar(tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.portrait_sharp, color: Colors.black),
                    ),
                    Tab(
                      icon: Icon(Icons.save_alt, color: Colors.black),
                    )
                  ]),
                ),
                Expanded(
                  flex: 5,
                  child: TabBarView(children: <Widget>[
                    GridView.count(
                      // clipBehavior: Clip.hardEdge,
                      // shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                      ],
                    ),
                    GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                        Expanded(
                          child: Ink.image(
                              image:
                                  const AssetImage("assets/images/logo.png")),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
