class ExamHistoryModel {
  ExamHistoryModel(
      {required this.id_exam,
      required this.email,
      required this.date_answered,
      required this.total_score});

  int id_exam;
  String email;
  String date_answered;
  int total_score;

  factory ExamHistoryModel.fromJson(Map<String, dynamic> json) =>
      ExamHistoryModel(
        id_exam: json["id_exam"],
        email: json["email"],
        date_answered: json["date_answered"],
        total_score: json["total_score"],
      );
}
