import 'package:exaa_2/models/dummy_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider with ChangeNotifier {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'EXAAII.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Dummy ('
          'id INTEGER PRIMARY KEY,'
          'name TEXT'
          ')');
    });
  }

  insertDummy(DummyModel dummy) async {
    // se realiza únicamente una instancia de la base de datos, gracias al patrón singleton
    final db = await database;
    notifyListeners();

    final res = await db?.rawInsert("INSERT INTO  Scans (id, tipo valor) "
        "VALUES ( ${dummy.id}, '${dummy.name}'')");

    return res;
  }
}
