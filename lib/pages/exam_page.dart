import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  static const String id = 'ExamPage';

  ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text('¿Dummy question?'),
                  ListTile(
                    leading: Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    title: const Text('Answer 1'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    title: const Text('Answer 2'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 3,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    title: const Text('Answer 3'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 4,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    title: const Text('Answer 4'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Anterior'),
                    onPressed: () {
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Siguiente'),
                    onPressed: () {
                
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}