import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
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
