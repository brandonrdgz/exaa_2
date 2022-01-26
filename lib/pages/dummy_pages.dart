//trash

import 'package:exaa_2/models/dummy_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  DummyModel dummy = DummyModel(id: 2, name: 'Alex');
  String? _centerText = 'Something';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(_centerText.toString()),
            IconButton(
                onPressed: () async {
                  List<DummyModel> res = await DBProvider.db.getDummies();
                  _centerText = res[1].name;
                  setState(() {});
                  //print(res[]);
                },
                icon: Icon(Icons.ac_unit))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('X'),
        onPressed: () async {
          final result = await DBProvider.db.insertDummy(dummy);
          _centerText = 'Nuevo registro';
          print(result);
          setState(() {});
        },
      ),
    );
  }
}
