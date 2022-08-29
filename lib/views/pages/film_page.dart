import 'package:desafio_star_wars/Models/model_films.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../controllers/films_api.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  State<FilmsPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<FilmsPage> {
  var results = <Results>[];

  @override
  void initState() {
    _getFilmes();
    super.initState();
  }

  _getFilmes() {
    FilmsApi.getFilms().then((response) {
      if (mounted) {
        setState(() {
          var respost = json.decode(response.body);
          var data = respost["results"] as List;
          results = data.map((e) => Results.fromJson(e)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index].title!),
        trailing: IconButton(
          icon: const Icon(Icons.star),
          onPressed: () {},
        ),
      ),
    );
  }
}
