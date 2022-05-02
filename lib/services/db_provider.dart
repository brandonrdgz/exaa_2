import 'package:exaa_2/models/answer_model.dart';
import 'package:exaa_2/models/dummy_model.dart';
import 'package:exaa_2/models/exam_result.dart';
import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/models/module_result.dart';
import 'package:exaa_2/models/question_model.dart';
import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/models/subtopic_model.dart';
import 'package:exaa_2/models/users_model.dart';
import 'package:exaa_2/services/firebase/auth.dart';
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
    final path = join(documentsDirectory.path, 'EXAAIIv13.db');
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

  Future insertQuestionsAndAnswers() async {
    final db = await database;

    for (String insertInstruction in SqlData.insertQuestionsAndAnswers) {
      await db?.rawInsert(insertInstruction);
    }

    print('insert questions and answers successful');
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

  Future<List<String>> getExamModules() async {
    final Database? db = await database;

    List<Map<String, Object?>>? modulesMapList = await db?.rawQuery('SELECT DISTINCT module_name FROM QUESTION');
    List<String> modulesList = [];

    for(Map<String, Object?> moduleMap in modulesMapList!) {
      modulesList.add(moduleMap['module_name']! as String);
    }

    return modulesList;
  }

  Future<List<String>> getTopicsOfExamModule(String examModule) async {
    final Database? db = await database;

    List<Map<String, Object?>>? topicsMapList = await db?.rawQuery('SELECT DISTINCT topic_name FROM QUESTION WHERE module_name = ?', [examModule]);
    List<String> topicsList = [];

    for(Map<String, Object?> topicMap in topicsMapList!) {
      topicsList.add(topicMap['topic_name'] as String);
    }

    return topicsList;
  }

  Future<List<QuestionModel>> getQuestions(String examModule, String moduleTopic) async {
    final Database? db = await database;

    List<Map<String, Object?>>? questionsMapList = await db?.rawQuery('SELECT * FROM QUESTION WHERE module_name = ? AND topic_name = ?', [examModule, moduleTopic]);
    List<QuestionModel> questionsList = [];

    for(Map<String, Object?> questionMap in questionsMapList!) {
      questionsList.add(QuestionModel.fromJson(questionMap));
    }

    return questionsList;
  }

  Future<List<AnswerModel>> getAnswers(int questionId) async {
    final Database? db = await database;

    List<Map<String, Object?>>? answersMapList = await db?.rawQuery('SELECT * FROM ANSWER WHERE id_question = ?', [questionId]);
    List<AnswerModel> answersList = [];

    for(Map<String, Object?> answerMap in answersMapList!) {
      answersList.add(AnswerModel.fromJson(answerMap));
    }

    return answersList;
  }

  Future<List<Map<String, Object>>> getQuestionsAndAnswers() async {
    final Database? db = await database;

    List<Map<String, Object?>>? questionsMapList = await db?.rawQuery('SELECT * FROM QUESTION');
    List<Map<String, Object?>>? answersMapList;
    List<Map<String, Object>> questionsAndAnswersMapList = [];

    for(Map<String, Object?> question in questionsMapList!) {
      QuestionModel questionModel = QuestionModel.fromJson(question);
      List<AnswerModel> answersList = [];

      answersMapList = await db?.rawQuery("SELECT * FROM ANSWER WHERE id_question = ?", [questionModel.id_question]);

      for(Map<String, Object?> answer in answersMapList!) {
        answersList.add(AnswerModel.fromJson(answer));
      }

      questionsAndAnswersMapList.add({
        "question": questionModel,
        "answers": answersList,
      });
    }

    print(questionsAndAnswersMapList);
    return questionsAndAnswersMapList;
  }

  insertExamResults(ExamResult examResult) async {
    final Database? db = await database; 

    int examId = await db!.rawInsert('INSERT INTO Exam_History (id_exam, email, date_answered, total_score) '
      'VALUES (null, ?, ?, ?)', [Auth.getEmail(), DateTime.now().toIso8601String(), examResult.totalScore]);

    for(ModuleResult moduleResult in examResult.modulesResult) {
      await _insertModuleResult(db, examId, moduleResult);
    }
  }

  _insertModuleResult(Database? db, int examId, ModuleResult moduleResult) async {
    await db!.rawInsert('INSERT INTO Exam_Detail (id_exam, module_name, score) ' 
      'VALUES (?, ?, ?)', [examId, moduleResult.moduleName, moduleResult.score]);
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
