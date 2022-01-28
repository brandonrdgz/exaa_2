class ExamQuestionModel {
  ExamQuestionModel({
    required this.idExam,
    required this.contentQuestion
  });

  num idExam;
  String contentQuestion;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) => ExamQuestionModel(
        idExam: json["idExam"],
        contentQuestion: json["contentQuestion"]
      );

  Map<String, dynamic> toJson() => {
        "idExam": idExam,
        "contentQuestion": contentQuestion
      };
}