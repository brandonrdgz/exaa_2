class QuestionModel {
  QuestionModel({
    required this.idQuestion,
    required this.moduleName,
    required this.topicName,
    required this.contentQuestion
  });

  int idQuestion;
  String moduleName;
  String topicName;
  String contentQuestion;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    idQuestion: json["id_question"],
    moduleName: json["module_name"],
    topicName: json["topic_name"],
    contentQuestion: json["content_question"],
  );
}
