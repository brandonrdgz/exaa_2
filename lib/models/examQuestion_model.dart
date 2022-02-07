class ExamQuestionModel {
  ExamQuestionModel({required this.id_exam, required this.content_question});

  num id_exam;
  String content_question;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      ExamQuestionModel(
          id_exam: json["id_exam"], content_question: json["content_question"]);

  Map<String, dynamic> toJson() =>
      {"id_exam": id_exam, "content_question": content_question};
}
