import 'package:exaa_2/models/module_result.dart';

class ExamResult {
  List<ModuleResult> modulesResult;
  int totalScore;

  ExamResult(this.modulesResult, this.totalScore);
}