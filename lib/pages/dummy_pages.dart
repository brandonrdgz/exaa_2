//trash

import 'package:exaa_2/models/dummy_model.dart';
import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:flutter/material.dart';

//reset branch comment
class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  DummyModel dummy = DummyModel(id: 2, name: 'Alex');
  String? _centerText = 'Mostrar data';
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
            RaisedButton(
                child: Text('Obtener información'),
                onPressed: () async {
                  List<ModuleModel> res = await DBProvider.db.getModules();
                  _centerText = res[0].name_module;
                  setState(() {});
                }),
            RaisedButton(
              child: Text('Insertar datos a la bd'),
              onPressed: () async {
                await DBProvider.db.insertRecordsModule();
                await DBProvider.db.insertRecordsTopic();
                _centerText = 'Nuevo registro';
              },
            )
          ],
        ),
      ),
    );
  }
}
