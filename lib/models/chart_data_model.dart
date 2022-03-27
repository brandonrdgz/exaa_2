class ChartDataModel {
  ChartDataModel({
    required this.module,
    required this.numberOfQuestions,
    required this.correctAnswers,
  });
  String module;
  int numberOfQuestions;
  int correctAnswers;
  double percetage = 0;

  double getPercentage() {
    percetage = (correctAnswers * 100) / numberOfQuestions;
    return percetage;
  }
}
