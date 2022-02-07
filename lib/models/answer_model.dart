class AnswerModel {
  AnswerModel(
      {required this.content_answer,
      required this.content_question,
      required this.is_correct});

  String content_answer;
  String content_question;
  num is_correct;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        content_answer: json["content_answer"],
        content_question: json["content_question"],
        is_correct: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "content_answer": content_answer,
        "content_question": content_question,
        "is_correct": is_correct
      };
}
