class QuestionModel {
  QuestionModel({
    required this.contentQuestion,
    required this.nameSubtopic
  });

  String contentQuestion;
  String nameSubtopic;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        contentQuestion: json["contentQuestion"],
        nameSubtopic: json["nameSubtopic"],
      );

  Map<String, dynamic> toJson() => {
        "contentQuestion": contentQuestion,
        "nameSubtopic": nameSubtopic
      };
}
