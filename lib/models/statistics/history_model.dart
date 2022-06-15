class HistoryModel {
  HistoryModel(
      {required this.email,
      required this.id_exam,
      required this.date_realization,
      required this.result});

  String email;
  num id_exam;
  String date_realization;
  num result;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      email: json["email"],
      id_exam: json["id_exam"],
      date_realization: json["date_realization"],
      result: json["result"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "id_exam": id_exam,
        "date_realization": date_realization,
        "result": result
      };
}
