import 'package:http/http.dart' as http;

const url = "https://swapi.dev/api/people/";

class CharsApi {
  static Future getChars() async {
    return await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   var respost = json.decode(response.body);
    //   var data = respost["results"] as List;
    //   List<Results> results = data.map((e) => Results.fromJson(e)).toList();

    //   print("funcionou");
    // } else {
    //   print("passou aqui");
    //   throw Exception(response.statusCode);
    // }
  }
}
