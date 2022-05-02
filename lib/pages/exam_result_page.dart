import 'package:exaa_2/models/exam_result.dart';
import 'package:exaa_2/models/module_result.dart';
import 'package:exaa_2/utils/constants.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:exaa_2/models/exam_answer.dart';
import 'package:exaa_2/models/module_questions.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class ExamResultPage extends StatefulWidget {
  static const String id = 'ExamResultPage';

  ExamResultPage({Key? key}) : super(key: key);

  @override
  State<ExamResultPage> createState() => _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  List<ModuleQuestions>? _exam;
  ExamResult? _examResult;
  final HtmlUnescape _htmlUnescape = HtmlUnescape();
  bool _firstBuild = true;
  String _moduleDropdownValue = '';
  int _moduleIndex = 0;
  int _questionIndex = 0;
  String _questionContent = '';
  final List<String> _questionAnswers = ['', '', '', ''];
  int _selectedAnswerIndex = -1;
  int _correctAnswerIndex = -1;

  @override
  Widget build(BuildContext context) {
    _exam ??= (ModalRoute.of(context)!.settings.arguments as Map)['exam'];
    _examResult ??= (ModalRoute.of(context)!.settings.arguments as Map)['examResult'];
    
    if(_firstBuild) {
      _firstBuild = false;
      _moduleDropdownValue = _exam![0].module;
      _updateQuestionContent();
      _updateAnswers();
    }

    return SafeArea(
      child: Scaffold(
        body: _buildExam(),
      ),
    );
  }

  void _updateQuestionContent() {
    _questionContent = _exam![_moduleIndex].questions[_questionIndex].question.contentQuestion;
  }

  void _updateAnswers() {
    for (int i = 0; i < _questionAnswers.length; i++) {
      _questionAnswers[i] = _exam![_moduleIndex].questions[_questionIndex].answers[i].answer.contentAnswer;
    }

    _selectedAnswerIndex = _exam![_moduleIndex].questions[_questionIndex].answers.indexWhere((ExamAnswer examAnswer) => examAnswer.isSelected);
    _correctAnswerIndex = _exam![_moduleIndex].questions[_questionIndex].answers.indexWhere((ExamAnswer examAnswer) => examAnswer.answer.isCorrect == Constants.trueSQLiteIntValue);
  }

  Widget _buildExam() {
    return Column(
      children: [
        _buildResultsHeader(),
        _buildModuleDropdown(),
        _buildScoresButton(),
        Expanded(
          child: _buildQuestionAnswersArea(),
        ),
        Row(
          children: [
            Expanded(
              child: _buildPreviousButton(),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: _buildNextButton(),
            ),
          ],
        )
      ],
    );
  }

  Padding _buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Resultados',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Padding _buildModuleDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          const Text(
            'Módulo: ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor, 
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(8.0),
                  value: _moduleDropdownValue,
                  items: _exam!.map<DropdownMenuItem<String>>((ModuleQuestions moduleQuestions) {
                    return DropdownMenuItem<String>(
                      value: moduleQuestions.module,
                      child: Text(moduleQuestions.module),
                    );
                  }).toList() ,
                  onChanged: (String? module) {
                    setState(() {
                      _moduleDropdownValue = module!;
                      _moduleIndex = _exam!
                        .indexWhere((ModuleQuestions moduleQuestions) => moduleQuestions.module == module);
                      _questionIndex = 0;
                      _updateQuestionContent();
                      _updateAnswers();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildScoresButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            child: const Text('Ver puntajes'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {
              CommonDialog.info(
                context,
                const Text('Puntajes'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildScoresTable(),
                    Text('Puntaje total de examen: ${_examResult!.totalScore * 100 ~/ Constants.totalQuestionsOfExam}')
                  ],
                ),
                onAccept: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScoresTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Módulo')),
          DataColumn(label: Text('Preguntas contestadas')),
          DataColumn(label: Text('Preguntas totales')),
          DataColumn(label: Text('Puntaje')),
        ],
        rows: _examResult!.modulesResult.map<DataRow>((ModuleResult moduleResult) {
          int totalQuestions = Constants.commonModules.contains(moduleResult.moduleName) ?
            Constants.totalQuestionsCommon :
            Constants.totalQuestionsSpecialty;
          int score = moduleResult.score * 100 ~/ totalQuestions;
    
          return DataRow(cells: [
            DataCell(Text(moduleResult.moduleName)),
            DataCell(Center(child: Text(moduleResult.score.toString()))),
            DataCell(Center(child: Text(totalQuestions.toString()))),
            DataCell(Center(child: Text(score.toString()))),
          ]);
        })
          .toList(),
      ),
    );
  }

  SingleChildScrollView _buildQuestionAnswersArea() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: HtmlWidget(
              '${(_questionIndex + 1).toString()}. ' + 
              _htmlUnescape.convert(_questionContent),
            ),
          ),
          ..._answersWidgets(),
        ],
      ),
    );
  }

  List<Widget> _answersWidgets() {
    return [0, 1, 2, 3].map<Row>((i) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: _buildAnswerIcon(i),
          ),
          Expanded(
            child: ListTile(
              leading: Radio(
                value: i,
                groupValue: _selectedAnswerIndex,
                onChanged: (int? value) {},
              ),
              title: HtmlWidget(
                _htmlUnescape.convert(_questionAnswers[i]),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildAnswerIcon (int answerIndex) {
    Widget answerIcon;
    if(answerIndex == _correctAnswerIndex && _selectedAnswerIndex != -1) {
      answerIcon = const Icon(Icons.check_circle, color: Colors.green,);
    }
    else if (answerIndex == _selectedAnswerIndex) {
      answerIcon = const Icon(Icons.cancel, color: Color.fromARGB(255, 255, 0, 0),);
    }
    else {
      answerIcon = const Icon(Icons.circle, color: Colors.white);
    }

    return answerIcon;
  }

  ElevatedButton _buildNextButton() {
    return ElevatedButton(
      child: const Text('Siguiente'),
      onPressed: _questionIndex == _exam![_moduleIndex].questions.length - 1 ? null : () {
        setState(() {
          ++_questionIndex;
          _updateQuestionContent();
          _updateAnswers();
        });
      },
    );
  }

  ElevatedButton _buildPreviousButton() {
    return ElevatedButton(
      child: const Text('Anterior'),
      onPressed: _questionIndex == 0 ? null : () {
        setState(() {
          --_questionIndex;
          _updateQuestionContent();
          _updateAnswers();
        });
      },
    );
  }
}