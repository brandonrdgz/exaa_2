import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/models/subtopic_model.dart';
import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/utils/sql_data.dart';
import 'package:exaa_2/widgets/alerts.dart';
import 'package:flutter/material.dart';

class TeachingMaterialDao {
  Future insertRecordsModule() async {
    final db = await DBProvider.db.database;

    for (int i = 0; i < SqlData.insertRecordsModule.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsModule[i]);
    }
    print('insert successful modules');
  }

  Future insertRecordsTopic() async {
    final db = await DBProvider.db.database;

    for (int i = 0; i < SqlData.insertRecordsTopic.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsTopic[i]);
    }
    print('insert successful topics');
  }

  Future insertRecordsSubtopic() async {
    final db = await DBProvider.db.database;

    for (int i = 0; i < SqlData.insertRecordsSubtopic.length; i++) {
      await db?.rawInsert(SqlData.insertRecordsSubtopic[i]);
    }
    print('insert successful subtopics');
  }

  Future<List<ModuleModel>> getModules(BuildContext context) async {
    final db = await DBProvider.db.database;
    var res;
    res = await db?.query('MODULE');
    print(res);
    if (!res.isNotEmpty) {
      await insertRecordsModule();
      await insertRecordsTopic();
      await insertRecordsSubtopic();
      Alerts.showAlertDialog(context);
    }
    List<ModuleModel> list = res.isNotEmpty
        ? res.map<ModuleModel>((c) => ModuleModel.fromJson(c)).toList()
        : <ModuleModel>[];
    print('Lista');

    return list;
  }

  Future<List<TopicModel>> getTopic() async {
    final db = await DBProvider.db.database;
    var res;
    res = await db?.query('TOPIC');
    List<TopicModel> list = res.isNotEmpty
        ? res.map<TopicModel>((c) => TopicModel.fromJson(c)).toList()
        : <TopicModel>[];

    return list;
  }

  Future<List<TopicModel>> getTopicByModule(String name_module) async {
    final db = await DBProvider.db.database;
    var res;
    res = await db
        ?.rawQuery('SELECT * FROM TOPIC WHERE name_module=?', [name_module]);
    List<TopicModel> list = res.isNotEmpty
        ? res.map<TopicModel>((c) => TopicModel.fromJson(c)).toList()
        : <TopicModel>[];
    print('despues del query');
    list.forEach((element) {
      print(element.name_topic);
    });

    return list;
  }

  Future<List<SubtopicModel>> getSubtopicByTopic(String name_topic) async {
    final db = await DBProvider.db.database;
    var res;
    res = await db
        ?.rawQuery('SELECT * FROM SUBTOPIC WHERE name_topic=?', [name_topic]);
    List<SubtopicModel> list = res.isNotEmpty
        ? res.map<SubtopicModel>((c) => SubtopicModel.fromJson(c)).toList()
        : <SubtopicModel>[];
    print('despues del query de subtopic');
    list.forEach((element) {
      print(element.name_subtopic);
    });
    
    return list;
  }
}