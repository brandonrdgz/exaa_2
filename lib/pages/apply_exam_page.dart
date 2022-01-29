import 'package:exaa_2/pages/exam_page.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter/material.dart';

class ApplyExamPage extends StatelessWidget {
  static const String id = 'ApplyExamPage';

  const ApplyExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'El examen que estás a punto de presentar se compone de los siguientes módulos y preguntas:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('Módulo')),
                  DataColumn(label: Text('Preguntas')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Comprensión lectora')),
                      DataCell(Text('30')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Redacción indirecta')),
                      DataCell(Text('30')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Pensamiento matemático')),
                      DataCell(Text('30')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Cálculo')),
                      DataCell(Text('24')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Física')),
                      DataCell(Text('24')),
                    ],
                  ),
                ]
              ),
              Text(
                'Siendo un total de 138 preguntas.\n',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                child: Text('Aplicar examen'),
                onPressed: () {
                  CommonDialog.dialog(
                    context,
                    content: Text('¿Está seguro de presentar este examen?'),
                    actions: [
                      TextButton(
                        child: const Text('Si'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, ExamPage.id);
                        }
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}