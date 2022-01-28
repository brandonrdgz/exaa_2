class HistoryModel {
  HistoryModel({
    required this.email,
    required this.idExam,
    required this.dateRealization,
    required this.result
  });

  String email;
  num idExam;
  String dateRealization;
  num result;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        email: json["email"],
        idExam: json["idExam"],
        dateRealization: json["dateRealization"],
        result: json["result"]
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "idExam": idExam,
        "dateRealization": dateRealization,
        "result": result
      };
}