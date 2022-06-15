import 'package:exaa_2/models/users_model.dart';
import 'package:exaa_2/utils/sql_data.dart';
import 'package:flutter/material.dart';
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
    if (_database == null) {
      _database = await initDB();

      return _database;
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'EXAAIIv507.db');

    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      for (int j = 0; j < SqlData.createTables.length; j++) {
        await db.execute(SqlData.createTables[j]);
      }
    });
  }

  insertUser(UsersModel user) async {
    // se realiza únicamente una instancia de la base de datos, gracias al patrón singleton
    final db = await database;
    notifyListeners();

    final res = await db?.rawInsert("INSERT INTO  USERS (username, email) "
        "VALUES ( '${user.username}', '${user.email}')");
    print('insert successful user');
    return res;
  }

  Future<List<UsersModel>> getUsers() async {
    final db = await database;
    var res;
    res = await db?.query('USERS');
    print(res);
    List<UsersModel> list = res.isNotEmpty
        ? res.map<UsersModel>((c) => UsersModel.fromJson(c)).toList()
        : <UsersModel>[];
    print('Lista');
    print(list[0].username);
    print(list[0].email);
    return list;
  }
}
