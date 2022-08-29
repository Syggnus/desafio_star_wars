import 'package:http/http.dart' as http;

const url = "https://swapi.dev/api/films/";

class FilmsApi {
  static Future getFilms() async {
    return await http.get(Uri.parse(url));
  }
}
