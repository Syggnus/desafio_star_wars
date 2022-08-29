import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'chars_page.dart';
import 'config_avatar_page.dart';
import 'film_page.dart';
import 'in_app_browser_page.dart';
import 'stars_page.dart';

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InAppBrowserPage(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfigAvatarPage(),
                  ),
                );
              },
              icon: FluttermojiCircleAvatar(),
            )
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
                text: "Favoritos",
                icon: Icon(Icons.star),
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          FilmsPage(),
          CharsPage(),
          StarsPage(),
        ]),
      ),
    );
  }
}
