import 'package:flutter/material.dart';
import '../../controllers/api_controller.dart';
import '../../database/database.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  State<FilmsPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<FilmsPage> {
  final ApiController _controller = ApiController();
  SqlDb mysql = SqlDb();
  bool changeMetodo = true;

  @override
  void initState() {
    getFilms();
    super.initState();
  }

  getFilms() async {
    await _controller.getApiFilms();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.resultsFilms.isEmpty
        ? Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.amber,
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: _controller.resultsFilms.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(_controller.resultsFilms[index].title!),
              trailing: IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  setState(
                    () {
                      if (changeMetodo == true) {
                        mysql.insertData('''INSERT INTO films ('title')
                      VALUES ("${_controller.resultsFilms[index].title!}")
                      ''');
                        changeMetodo == false;
                      } else {
                        mysql.deleteData(
                            'DELETE FROM films WHERE title = "${_controller.resultsFilms[index].title!}"');
                        changeMetodo == true;
                      }
                    },
                  );
                },
              ),
            ),
          );
  }
}
