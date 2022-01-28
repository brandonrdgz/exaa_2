class ExamModel {
  ExamModel({
    required this.idExam,
    required this.typeExam
  });

  num idExam;
  String typeExam;

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        idExam: json["idExam"],
        typeExam: json["typeExam"]
      );

  Map<String, dynamic> toJson() => {
        "idExam": idExam,
        "typeExam": typeExam
      };
}