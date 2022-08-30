import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/model_chars.dart';
import '../Models/model_films.dart';

class ApiController {
  List<ResultsChars> resultsChars = [];
  List<ResultsFilms> resultsFilms = [];

  Future<void> getApiChars() async {
    debugPrint("Pesquisando...");
    try {
      var responseChars =
          await http.get(Uri.parse("https://swapi.dev/api/people/"));

      if (responseChars.statusCode == 200) {
        var respost = json.decode(responseChars.body);
        Iterable data = respost["results"] as List;
        resultsChars = data.map((e) => ResultsChars.fromJson(e)).toList();
        debugPrint("Quantidade de Personagens: ${resultsChars.length}");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> getApiFilms() async {
    debugPrint("Pesquisando...");
    try {
      var responseFilms =
          await http.get(Uri.parse("https://swapi.dev/api/films/"));

      if (responseFilms.statusCode == 200) {
        var respost = json.decode(responseFilms.body);
        Iterable data = respost["results"] as List;
        resultsFilms = data.map((e) => ResultsFilms.fromJson(e)).toList();
        debugPrint("Quantidade de Filmes: ${resultsFilms.length}");
      }
    } catch (e) {
      return;
    }
  }
}
