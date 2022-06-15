import 'package:exaa_2/daos/exam/exam_dao.dart';
import 'package:exaa_2/pages/exam/exam_page.dart';
import 'package:exaa_2/utils/constants.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter/material.dart';

class ApplyExamPage extends StatefulWidget {
  static const String id = 'ApplyExamPage';

  ApplyExamPage({Key? key}) : super(key: key);

  @override
  State<ApplyExamPage> createState() => _ApplyExamPageState();
}

class _ApplyExamPageState extends State<ApplyExamPage> {
  Widget _examInfo = Container();

  @override
  Widget build(BuildContext context) {
    _initExamInfo(context);

    return SafeArea(
      child: Scaffold(
        body: _examInfo,
      ),
    );
  }

  Future<bool> _dbHasNotQuestions() async {
    List examModules = await ExamDao().getExamModules();

    return examModules.isEmpty;
  }

  void _initExamInfo(BuildContext context) async {
    if (await _dbHasNotQuestions()) {
      CommonDialog.info(
        context,
        const Text('Info'),
        const Text('Se necesita cargar información adicional para poder aplicar un examen'),
        onAccept: () { 
          Navigator.pop(context);
          CommonDialog.waitDialog(
            context,
            content: const Text('Cargando información'),
            future: ExamDao().insertQuestionsAndAnswers(),
            onSuccess: (result) {
              CommonDialog.info(
                context,
                const Text('Éxito'),
                const Text('La información ha sido cargada correctamente'),
                onAccept: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            },
            onError: (error) {
              CommonDialog.error(context, error);
            },
          );
        },
      );
    }
    else {
      setState(() {
        _examInfo = _buildExamInfo(context);
      });
    }
  }

  Padding _buildExamInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            'El examen que estás a punto de presentar se compone de los siguientes módulos y preguntas:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          _buildDataTable(),
          const Text(
            'Siendo un total de ${Constants.totalQuestionsOfExam} preguntas.\n',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            child: const Text('Aplicar examen'),
            onPressed: () {
              _showConfirmDialog();
            },
          ),
        ],
      ),
    );
  }

  DataTable _buildDataTable() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Módulo')),
        DataColumn(label: Text('Preguntas')),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('Comprensión lectora')),
            DataCell(Center(child: Text('30'))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Estructura de la lengua')),
            DataCell(Center(child: Text('30'))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Pensamiento analítico')),
            DataCell(Center(child: Text('30'))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Pensamiento matemático')),
            DataCell(Center(child: Text('30'))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Cálculo')),
            DataCell(Center(child: Text('24'))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Física')),
            DataCell(Center(child: Text('24'))),
          ],
        ),
      ]
    );
  }

  void _showConfirmDialog() {
    CommonDialog.confirm(
      context,
      const Text('¿Está seguro de presentar este examen?'),
      onConfirm: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, ExamPage.id);
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}