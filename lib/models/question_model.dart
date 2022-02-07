class QuestionModel {
  QuestionModel({required this.content_question, required this.name_subtopic});

  String content_question;
  String name_subtopic;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        content_question: json["content_question"],
        name_subtopic: json["name_subtopic"],
      );

  Map<String, dynamic> toJson() =>
      {"content_question": content_question, "name_subtopic": name_subtopic};
}
