import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:flutter/material.dart';

class TestExamQuery extends StatelessWidget {
  const TestExamQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DBProvider.db.getExamsByUser(Auth.getEmail().toString());
          await DBProvider.db.getDetailByExam(2);
        },
      ),
    );
  }
}
