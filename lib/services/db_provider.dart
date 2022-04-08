import 'package:exaa_2/models/dummy_model.dart';
import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/models/subtopic_model.dart';
import 'package:exaa_2/models/users_model.dart';
import 'package:exaa_2/utils/sql_data.dart';
import 'package:exaa_2/widgets/alerts.dart';
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
    if (_database == null) {
      _database = await initDB();

      print("Dentro del else");
      return _database;
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'EXAAIIv500.db');
    print(path.toString());

    return await openDatabase(path, version: 2, onOpen: (db) {},
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

  Future insertRecordsSubtopic() async {
    final db = await database;

    for (int i = 0; i < SqlData.insertRecordsSubtopic.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsSubtopic[i]);
    }
    print('insert successful subtopics');
  }

  Future<List<ModuleModel>> getModules(BuildContext context) async {
    final db = await database;
    var res;
    res = await db?.query('MODULE');
    print(res);
    if (!res.isNotEmpty) {
      await DBProvider.db.insertRecordsModule();
      await DBProvider.db.insertRecordsTopic();
      await DBProvider.db.insertRecordsSubtopic();
      Alerts.showAlertDialog(context);
    }
    List<ModuleModel> list = res.isNotEmpty
        ? res.map<ModuleModel>((c) => ModuleModel.fromJson(c)).toList()
        : <ModuleModel>[];
    print('Lista');

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

  //FUNCIÓN PARA OBTENER LOS SUBTÓPICOS DE UN TÓPICO
  Future<List<SubtopicModel>> getSubtopicByTopic(String name_topic) async {
    final db = await database;
    var res;
    /*res = await db
        ?.rawQuery("select * from TOPIC where name_module = '$name_module';");*/
    //res = await db?.query('TOPIC', where: "name_module = ?", whereArgs: [name_module]);
    res = await db
        ?.rawQuery('SELECT * FROM SUBTOPIC WHERE name_topic=?', [name_topic]);
    List<SubtopicModel> list = res.isNotEmpty
        ? res.map<SubtopicModel>((c) => SubtopicModel.fromJson(c)).toList()
        : <SubtopicModel>[];
    print('despues del query de subtopic');
    list.forEach((element) {
      print(element.name_subtopic);
    });
    /*var decoded = TopicModel.fromJson(res.first);
    print(decoded.description_topic);
    print(decoded.name_topic);*/
    return list;
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
