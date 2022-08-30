import 'package:flutter/material.dart';
import '../../database/database.dart';

class StarsPage extends StatefulWidget {
  const StarsPage({Key? key}) : super(key: key);

  @override
  State<StarsPage> createState() => _StarsPageState();
}

class _StarsPageState extends State<StarsPage> {
  SqlDb mysql = SqlDb();

  List<String> personagens = [
    "Luke Skywalker",
    "C-3PO",
    "R2-D2",
    "Darth Vader",
    "Leia Organa",
    "Owen Lars",
    "Beru Whitesun lars",
    "R5-D4",
    "Biggs Darklighter",
    "Obi-Wan Kenobi"
  ];

  Future<List<Map>> readData() async {
    List<Map> response = await mysql.readData("SELECT * FROM films");
    return response;
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readData(),
      builder: (context, AsyncSnapshot<List<Map>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: personagens.contains(
                        snapshot.data![index]["title"],
                      )
                          ? Colors.red
                          : Colors.green,
                      width: 1,
                    ),
                  ),
                  title: Text("${snapshot.data![index]['title']}"),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.amber,
          ),
        );
      },
    );
  }
}
