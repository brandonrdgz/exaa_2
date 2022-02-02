import 'package:exaa_2/models/dummy_model.dart';
import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/utils/sql_data.dart';
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
    final path = join(documentsDirectory.path, 'EXAAIIv19.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      for (int j = 0; j < SqlData.createTables.length; j++) {
        await db.execute(SqlData.createTables[j]);
      }
    });
  }

  insertDummy(DummyModel dummy) async {
    // se realiza únicamente una instancia de la base de datos, gracias al patrón singleton
    final db = await database;
    notifyListeners();

    final res = await db?.rawInsert("INSERT INTO  Dummy (id, name) "
        "VALUES ( '${dummy.id}', '${dummy.name}')");

    return res;
  }

  Future<List<DummyModel>> getDummies() async {
    final db = await database;
    var res;
    res = await db?.query('Dummy');
    print(res);
    List<DummyModel> list = res.isNotEmpty
        ? res.map<DummyModel>((c) => DummyModel.fromJson(c)).toList()
        : <DummyModel>[];
    print('Lista');
    print(list[1].name);
    return list;
  }

  Future insertRecordsModule() async {
    final db = await database;

    for (int i = 0; i < SqlData.insertRecordsModule.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsModule[i]);
    }
    print('insert successful modules');
  }

//FUNCION PARA LLEVAR A CABO LA INSERCIÓN DE LOS TOPICOS
  Future insertRecordsTopic() async {
    final db = await database;

    for (int i = 0; i < SqlData.insertRecordsTopic.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsTopic[i]);
    }
    print('insert successful topics');
  }

  Future<List<ModuleModel>> getModules() async {
    final db = await database;
    var res;
    res = await db?.query('MODULE');
    print(res);
    List<ModuleModel> list = res.isNotEmpty
        ? res.map<ModuleModel>((c) => ModuleModel.fromJson(c)).toList()
        : <ModuleModel>[];
    print('Lista');
    print(list[0].name_module);
    return list;
  }

  //FUNCIÓN PARA OBTENER LOS TÓPICOS EXISTENTES
  Future<List<TopicModel>> getTopic() async {
    final db = await database;
    var res;
    res = await db?.query('TOPIC');
    //print(res);
    List<TopicModel> list = res.isNotEmpty
        ? res.map<TopicModel>((c) => TopicModel.fromJson(c)).toList()
        : <TopicModel>[];
    //print('Lista');
    //print(list[0].name_topic);
    return list;
  }

  Future<List<TopicModel>> getTopicByModule(String name_module) async {
    final db = await database;
    var res;
    /*res = await db
        ?.rawQuery("select * from TOPIC where name_module = '$name_module';");*/
    //res = await db?.query('TOPIC', where: "name_module = ?", whereArgs: [name_module]);
    res = await db
        ?.rawQuery('SELECT * FROM TOPIC WHERE name_module=?', [name_module]);
    List<TopicModel> list = res.isNotEmpty
        ? res.map<TopicModel>((c) => TopicModel.fromJson(c)).toList()
        : <TopicModel>[];
    print('despues del query');
    list.forEach((element) {
      print(element.name_topic);
    });
    /*var decoded = TopicModel.fromJson(res.first);
    print(decoded.description_topic);
    print(decoded.name_topic);*/
    return list;
  }
}
