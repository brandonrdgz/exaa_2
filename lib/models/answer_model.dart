class AnswerModel {
  AnswerModel({
    required this.contentAnswer,
    required this.contentQuestion,
    required this.isCorrect
  });

  String contentAnswer;
  String contentQuestion;
  num isCorrect;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        contentAnswer: json["contentAnswer"],
        contentQuestion: json["contentQuestion"],
        isCorrect: json["isCorrect"],
      );

  Map<String, dynamic> toJson() => {
        "contentAnswer": contentAnswer,
        "contentQuestion": contentQuestion,
        "isCorrect": isCorrect
      };
}