import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'home_page.dart';
import 'in_app_browser_page.dart';

class ConfigAvatarPage extends StatelessWidget {
  const ConfigAvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: FluttermojiCircleAvatar(),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: FluttermojiCircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              SizedBox(
                width: min(600, width * 0.85),
                child: Row(
                  children: [
                    Text(
                      "Customize:",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Spacer(),
                    FluttermojiSaveWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: FluttermojiCustomizer(
                  scaffoldWidth: min(600, width * 0.85),
                  autosave: false,
                  theme: FluttermojiThemeData(
                    boxDecoration: const BoxDecoration(
                      boxShadow: [BoxShadow()],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
