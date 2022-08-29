import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Models/model_chars.dart';
import '../../controllers/chars_api.dart';

class CharsPage extends StatefulWidget {
  const CharsPage({Key? key}) : super(key: key);

  @override
  State<CharsPage> createState() => _CharsPageState();
}

class _CharsPageState extends State<CharsPage> {
  var results = <Results>[];

  _getFilmes() {
    CharsApi.getChars().then((response) {
      setState(() {
        var respost = json.decode(response.body);
        Iterable data = respost["results"] as List;
        results = data.map((e) => Results.fromJson(e)).toList();
      });
    });
  }

  @override
  void initState() {
    _getFilmes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index].name!),
        trailing: IconButton(
          icon: const Icon(Icons.star),
          onPressed: () {},
        ),
      ),
    );
  }
}
