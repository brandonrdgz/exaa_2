import 'package:exaa_2/models/chart_data_model.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<ChartDataModel> chartData = [
    ChartDataModel(
        module: "Estructura de la lengua",
        numberOfQuestions: 30,
        correctAnswers: 25),
    ChartDataModel(
        module: "Comprensión lectora",
        numberOfQuestions: 30,
        correctAnswers: 14),
    ChartDataModel(
        module: "Pensamiento matemático",
        numberOfQuestions: 30,
        correctAnswers: 27),
    ChartDataModel(
        module: "Cálculo", numberOfQuestions: 24, correctAnswers: 12),
    ChartDataModel(module: "Física", numberOfQuestions: 24, correctAnswers: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estadísticas"),
      ),
      body: Center(
        child: Text("Cuerpo"),
      ),
    );
  }
}
