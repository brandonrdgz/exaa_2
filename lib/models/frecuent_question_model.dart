class FrecuentQuestionModel {
  FrecuentQuestionModel({required this.question, required this.id});

  String question;
  int id;

  factory FrecuentQuestionModel.fromJson(Map<String, dynamic> json) =>
      FrecuentQuestionModel(
        question: json["content_question"],
        id: json["name_subtopic"],
      );

  Map<String, dynamic> toJson() =>
      {"content_question": question, "name_subtopic": id};
}
