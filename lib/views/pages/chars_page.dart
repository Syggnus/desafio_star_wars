import '../../controllers/api_controller.dart';
import 'package:flutter/material.dart';

import '../../database/database.dart';

class CharsPage extends StatefulWidget {
  const CharsPage({Key? key}) : super(key: key);

  @override
  State<CharsPage> createState() => _CharsPageState();
}

class _CharsPageState extends State<CharsPage> {
  final ApiController _controller = ApiController();
  SqlDb mysql = SqlDb();
  bool changeMetodo = true;

  @override
  void initState() {
    getChars();

    super.initState();
  }

  getChars() async {
    await _controller.getApiChars();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.resultsChars.isEmpty
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
            padding: const EdgeInsets.all(10),
            itemCount: _controller.resultsChars.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(_controller.resultsChars[index].name!),
              trailing: IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  setState(
                    () {
                      if (changeMetodo == true) {
                        mysql.insertData('''INSERT INTO films ('title')
                      VALUES ("${_controller.resultsChars[index].name!}")
                          ''');
                        changeMetodo = false;
                      } else {
                        mysql.deleteData(
                            'DELETE FROM films WHERE title = "${_controller.resultsChars[index].name!}"');
                        changeMetodo = true;
                      }
                    },
                  );
                }, //
              ),
            ),
          );
  }
}
