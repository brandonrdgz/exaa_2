import 'dart:async';

import 'package:exaa_2/models/exam_result.dart';
import 'package:exaa_2/pages/exam_result_page.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:exaa_2/models/exam_answer.dart';
import 'package:exaa_2/models/module_questions.dart';
import 'package:exaa_2/utils/exam_utils.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class ExamPage extends StatefulWidget {
  static const String id = 'ExamPage';

  ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final List<ModuleQuestions> _exam = [];
  late Future<List<ModuleQuestions>> _examQuestionsFuture;
  final HtmlUnescape _htmlUnescape = HtmlUnescape();
  bool _firstTimeBuild = true;
  String _moduleDropdownValue = '';
  int _moduleIndex = 0;
  int _questionIndex = 0;
  String _questionContent = '';
  final List<String> _questionAnswers = ['', '', '', ''];
  int _answerIndex = -1;

  @override
  void initState() {
    super.initState();
    _examQuestionsFuture = ExamUtils.getExamQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
        FutureBuilder<List<ModuleQuestions>>(
          future: _examQuestionsFuture,
          builder: (BuildContext buildContext, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(_firstTimeBuild) {
                _exam.addAll(snapshot.data!);
                _firstTimeBuild = false;
                _moduleDropdownValue = _exam[0].module;
                _updateQuestionContent();
                _updateAnswers();
              }

              return _buildExam();
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _updateQuestionContent() {
    _questionContent = _exam[_moduleIndex].questions[_questionIndex].question.content_question;
  }

  void _updateAnswers() {
    for (int i = 0; i < _questionAnswers.length; i++) {
      _questionAnswers[i] = _exam[_moduleIndex].questions[_questionIndex].answers[i].answer.content_answer;
    }

    _answerIndex = _exam[_moduleIndex].questions[_questionIndex].answers.indexWhere((ExamAnswer examAnswer) => examAnswer.isSelected);
  }

  Widget _buildExam() {
    return Column(
      children: [
        _buildModuleDropdown(),
        _buildExamFinaleButton(),
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
                  items: _exam.map<DropdownMenuItem<String>>((ModuleQuestions moduleQuestions) {
                    return DropdownMenuItem<String>(
                      value: moduleQuestions.module,
                      child: Text(moduleQuestions.module),
                    );
                  }).toList() ,
                  onChanged: (String? module) {
                    setState(() {
                      _moduleDropdownValue = module!;
                      _moduleIndex = _exam
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

  Padding _buildExamFinaleButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            child: const Text('Finalizar examen'),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 255, 0, 0),
            ),
            onPressed: () {
              CommonDialog.confirm(
                context,
                const Text('¿Está seguro que desea finalizar el examen?'),
                onConfirm: () {
                  ExamResult examResult = ExamUtils.evaluateExam(_exam);
                  
                  CommonDialog.waitDialog(
                    context,
                    content: const Text('Guardando examen...'),
                    future: DBProvider.db.insertExamResults(examResult),
                    onSuccess: (result) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        ExamResultPage.id,
                        arguments: {
                          'exam': _exam,
                          'examResult': examResult, 
                        },
                      );
                    },
                    onError: (error) {
                      CommonDialog.error(context, error);
                    },
                  );
                },
                onCancel: () {
                  Navigator.pop(context);
                }
              );
            },
          ),
        ],
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
    return [0, 1, 2, 3].map<ListTile>((i) {
      return ListTile(
        leading: Radio(
          value: i,
          groupValue: _answerIndex,
          onChanged: (int? value) {
            setState(() {
              if(_answerIndex != -1) {
                _exam[_moduleIndex].questions[_questionIndex].answers[_answerIndex].isSelected = false;
              }

              _answerIndex = value!;
              _exam[_moduleIndex].questions[_questionIndex].answers[_answerIndex].isSelected = true;
            });
          },
        ),
        title: HtmlWidget(
          _htmlUnescape.convert(_questionAnswers[i]),
        ),
      );
    }).toList();
  }

  ElevatedButton _buildNextButton() {
    return ElevatedButton(
      child: const Text('Siguiente'),
      onPressed: _questionIndex == _exam[_moduleIndex].questions.length - 1 ? null : () {
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