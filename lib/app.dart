import 'package:flutter/material.dart';
import 'views/pages/home_page.dart';

class StarWarsApp extends StatefulWidget {
  const StarWarsApp({Key? key}) : super(key: key);

  @override
  State<StarWarsApp> createState() => _MyAppState();
}

class _MyAppState extends State<StarWarsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
