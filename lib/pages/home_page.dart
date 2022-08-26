import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: TextButton(
            child: const Text(
              "Site Oficial",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          actions: [
            FluttermojiCircleAvatar(
              radius: 30,
            ),
          ],
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Filmes",
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: "Personagens",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Filmes",
                icon: Icon(Icons.star),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Tab1"),
            ),
            Center(
              child: Text("Tab2"),
            ),
            Center(
              child: Text("Tab3"),
            )
          ],
        ),
      ),
    );
  }
}
