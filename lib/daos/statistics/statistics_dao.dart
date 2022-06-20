import 'package:exaa_2/models/statistics/exam_detail_model.dart';
import 'package:exaa_2/models/statistics/exam_history_model.dart';
import 'package:exaa_2/services/sqlite/db_provider.dart';

class StatisticsDao {
  Future<List<Map<Object, Object>>> getExamsHistory(String email) async {
    List<Map<Object, Object>> examsHistory = [];
    List<ExamHistoryModel> exams = await _getExamsByUser(email);

    for(ExamHistoryModel examHistoryModel in exams) {
      List<ExamDetailModel> examDetailsModel = await _getExamDetails(examHistoryModel.id_exam);
      examsHistory.add({
        'exam': examHistoryModel,
        'examDetails': examDetailsModel,
      });
    }

    return examsHistory;
  }

  Future<List<ExamHistoryModel>> _getExamsByUser(String email) async {
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

  Future<List<ExamDetailModel>> _getExamDetails(int id_exam) async {
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
}