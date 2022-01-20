import 'package:flutter/material.dart';

class TopicLearningPage extends StatelessWidget {
  const TopicLearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: Center(
        child: Text('Learning page for ' + arguments['module']),
      ),
    );
  }
}
