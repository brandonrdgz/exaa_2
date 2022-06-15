import 'package:exaa_2/models/exam_detail_model.dart';
import 'package:exaa_2/models/exam_history_model.dart';
import 'package:exaa_2/models/exam_result.dart';
import 'package:exaa_2/models/module_result.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:sqflite/sqflite.dart';

class StatisticsDao {
  insertExamResults(ExamResult examResult) async {
    final Database? db = await DBProvider.db.database; 

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

  Future<List<ExamHistoryModel>> getExams() async {
    final db = await DBProvider.db.database;
    var res;
    res = await db?.query('EXAM_HISTORY');
    print(res);
    List<ExamHistoryModel> list = res.isNotEmpty
        ? res
            .map<ExamHistoryModel>((c) => ExamHistoryModel.fromJson(c))
            .toList()
        : <ExamHistoryModel>[];
    print('Lista de todos los exámenes: ');
    print(list[0].id_exam);
    print(list[0].email);
    print(list[0].date_answered);
    print(list[0].total_score);
    return list;
  }

  Future<List<ExamHistoryModel>> getExamsByUser(String email) async {
    final db = await DBProvider.db.database;
    var res;
    res =
        await db?.rawQuery('SELECT * FROM EXAM_HISTORY WHERE email=?', [email]);
    List<ExamHistoryModel> list = res.isNotEmpty
        ? res
            .map<ExamHistoryModel>((c) => ExamHistoryModel.fromJson(c))
            .toList()
        : <ExamHistoryModel>[];
    list.forEach((element) {
      
    });
    return list;
  }

  Future<List<ExamDetailModel>> getDetailByExam(int id_exam) async {
    final db = await DBProvider.db.database;
    var res;
    res = await db
        ?.rawQuery('SELECT * FROM EXAM_DETAIL WHERE id_exam=?', [id_exam]);
    List<ExamDetailModel> list = res.isNotEmpty
        ? res.map<ExamDetailModel>((c) => ExamDetailModel.fromJson(c)).toList()
        : <ExamDetailModel>[];
    list.forEach((element) {
    });
    return list;
  }

  Future<List<ExamDetailModel>> getDetailByModuleANDId(
      String module_name, int id_exam) async {
    final db = await DBProvider.db.database;
    var res;
    res = await db?.rawQuery(
        'SELECT score FROM EXAM_DETAIL WHERE module_name=? AND id_exam=?',
        [module_name, id_exam]);
    print(res);
    List<ExamDetailModel> list = res.isNotEmpty
        ? res.map<ExamDetailModel>((c) => ExamDetailModel.fromJson(c)).toList()
        : <ExamDetailModel>[];
    print('Lista de los detalles por modulo: ');
    list.forEach((element) {
      print(element.id_exam);
      print(element.module_name);
      print(element.score);
    });
    return list;
  }
}