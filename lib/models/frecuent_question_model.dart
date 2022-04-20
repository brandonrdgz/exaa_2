class FrecuentQuestionModel {
  FrecuentQuestionModel(
      {required this.question, required this.category, required this.answer});

  String question, category, answer;

  factory FrecuentQuestionModel.fromJson(Map<String, dynamic> json) =>
      FrecuentQuestionModel(
          question: json["content_question"],
          category: json["category"],
          answer: json["answer"]);

  Map<String, dynamic> toJson() =>
      {"content_question": question, "category": category, "answer": answer};
}
