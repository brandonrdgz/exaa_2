//trash
import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  String? _centerText = 'Something';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_centerText.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('X'),
        onPressed: () {
          _centerText = 'new Value';
          setState(() {});
        },
      ),
    );
  }
}
