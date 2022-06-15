class AnswerModel {
  AnswerModel({
    required this.idQuesiton,
    required this.contentAnswer,
    required this.isCorrect
  });

  int idQuesiton;
  String contentAnswer;
  num isCorrect;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
    idQuesiton: json["id_question"],
    contentAnswer: json["content_answer"],
    isCorrect: json["is_correct"],
  );
}
