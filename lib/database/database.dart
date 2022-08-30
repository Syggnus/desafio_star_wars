import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    } else {
      return _db;
    }
    return null;
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "data.db");
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      //onDowngrade: _onDowngrade,
      version: 1,
    );
    return mydb;
  }

  _onCreate(db, versao) async {
    await db.execute(_films);
    // await db.execute(_avatarConfig);
  }

  //_onDowngrade(db, versao) async {}

  String get _films => '''
  CREATE TABLE films (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT
  );
  ''';

  insertData(String stg) async {
    Database? mydb = await db;
    if (mydb != null) {
      int response = await mydb.rawInsert(stg);
      return response;
    }
  }

  deleteData(String stg) async {
    Database? mydb = await db;
    if (mydb != null) {
      int response = await mydb.rawDelete(stg);
      return response;
    }
  }

  upgradeData(String stg) async {
    Database? mydb = await db;
    if (mydb != null) {
      int response = await mydb.rawUpdate(stg);
      return response;
    }
  }

  readData(String stg) async {
    Database? mydb = await db;
    if (mydb != null) {
      List<Map> response = await mydb.rawQuery(stg);
      return response;
    }
  }
}
