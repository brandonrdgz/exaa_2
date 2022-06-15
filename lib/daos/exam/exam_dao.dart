import 'package:exaa_2/models/exam/answer_model.dart';
import 'package:exaa_2/models/exam/question_model.dart';
import 'package:exaa_2/services/sqlite/db_provider.dart';
import 'package:exaa_2/utils/sql_data.dart';
import 'package:sqflite/sqflite.dart';

class ExamDao {
  Future insertQuestionsAndAnswers() async {
    final db = await DBProvider.db.database;

    for (String insertInstruction in SqlData.insertQuestionsAndAnswers) {
      await db?.rawInsert(insertInstruction);
    }

    print('insert questions and answers successful');
  }

  Future<List<String>> getExamModules() async {
    final Database? db = await DBProvider.db.database;

    List<Map<String, Object?>>? modulesMapList = await db?.rawQuery('SELECT DISTINCT module_name FROM QUESTION');
    List<String> modulesList = [];

    for(Map<String, Object?> moduleMap in modulesMapList!) {
      modulesList.add(moduleMap['module_name']! as String);
    }

    return modulesList;
  }

  Future<List<String>> getTopicsOfExamModule(String examModule) async {
    final Database? db = await DBProvider.db.database;

    List<Map<String, Object?>>? topicsMapList = await db?.rawQuery('SELECT DISTINCT topic_name FROM QUESTION WHERE module_name = ?', [examModule]);
    List<String> topicsList = [];

    for(Map<String, Object?> topicMap in topicsMapList!) {
      topicsList.add(topicMap['topic_name'] as String);
    }

    return topicsList;
  }

  Future<List<QuestionModel>> getQuestions(String examModule, String moduleTopic) async {
    final Database? db = await DBProvider.db.database;

    List<Map<String, Object?>>? questionsMapList = await db?.rawQuery('SELECT * FROM QUESTION WHERE module_name = ? AND topic_name = ?', [examModule, moduleTopic]);
    List<QuestionModel> questionsList = [];

    for(Map<String, Object?> questionMap in questionsMapList!) {
      questionsList.add(QuestionModel.fromJson(questionMap));
    }

    return questionsList;
  }

  Future<List<AnswerModel>> getAnswers(int questionId) async {
    final Database? db = await DBProvider.db.database;

    List<Map<String, Object?>>? answersMapList = await db?.rawQuery('SELECT * FROM ANSWER WHERE id_question = ?', [questionId]);
    List<AnswerModel> answersList = [];

    for(Map<String, Object?> answerMap in answersMapList!) {
      answersList.add(AnswerModel.fromJson(answerMap));
    }

    return answersList;
  }
}