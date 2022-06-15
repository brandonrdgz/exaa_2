class ExamDetailModel {
  ExamDetailModel(
      {required this.id_exam,
      required this.module_name,
      required this.score});

  int id_exam;
  String module_name;
  int score;

  factory ExamDetailModel.fromJson(Map<String, dynamic> json) =>
     ExamDetailModel(
        id_exam: json["id_exam"],
        module_name: json["module_name"],
        score: json["score"],
      );
}