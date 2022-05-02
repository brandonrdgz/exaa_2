import 'dart:math';

import 'package:exaa_2/models/answer_model.dart';
import 'package:exaa_2/models/exam_answer.dart';
import 'package:exaa_2/models/exam_question.dart';
import 'package:exaa_2/models/exam_result.dart';
import 'package:exaa_2/models/module_questions.dart';
import 'package:exaa_2/models/module_result.dart';
import 'package:exaa_2/models/question_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/utils/constants.dart';

class ExamUtils {
  static Future<List<ModuleQuestions>> getExamQuestions() async {
    List<ModuleQuestions> exam = [];
    List<String> examModules = await DBProvider.db.getExamModules();
    List<String> moduleTopics;
    int questionsPerTopic = 0; 
    int questionsGenerated = 0;
    int totalOfQuestions = 0;

    for(String examModule in examModules) {
      List<QuestionModel> questions = [];
      totalOfQuestions = _getTotalOfQuestions(examModule);

      moduleTopics = await DBProvider.db.getTopicsOfExamModule(examModule);
      questionsPerTopic = _getQuestionsPerTopic(moduleTopics, totalOfQuestions); 

      questionsGenerated = 0;

      if(moduleTopics.isEmpty) {
        questions.addAll(await _getQuestionsFromTopic(examModule, '', questionsPerTopic));
      }
      else {
        for(String moduleTopic in moduleTopics) {
          questions.addAll(await _getQuestionsFromTopic(examModule, moduleTopic, questionsPerTopic));
          questionsGenerated += questionsPerTopic;
        }

        if(questionsGenerated != totalOfQuestions) {
          questions = await _getRemainingQuestions(questionsGenerated, totalOfQuestions, moduleTopics, examModule, questions);
        }
      }

      List<ExamQuestion> examQuestionList = [];
      List<AnswerModel> answerModelList;
      List<ExamAnswer> examAnswerList;

      for(QuestionModel questionModel in questions) {
        answerModelList = await DBProvider.db.getAnswers(questionModel.idQuestion);
        examAnswerList = answerModelList.map<ExamAnswer>((AnswerModel answerModel) {
          return ExamAnswer(answerModel, false);
        }).toList();

        examQuestionList.add(ExamQuestion(questionModel, examAnswerList));
      }

      exam.add(ModuleQuestions(examModule, examQuestionList));
    }

    return exam;
  }

  static int _getTotalOfQuestions(String examModule) {
    return Constants.commonModules.contains(examModule) ?
      Constants.totalQuestionsCommon :
      Constants.totalQuestionsSpecialty;
  }

  static int _getQuestionsPerTopic(List<String> moduleTopics, int totalOfQuestions) {
    return moduleTopics.isEmpty ?
      totalOfQuestions :
      totalOfQuestions ~/ moduleTopics.length;
  }

  static Future<List<QuestionModel>> _getRemainingQuestions(
    int questionsGenerated,
    int totalOfQuestions,
    List<String> moduleTopics,
    String examModule,
    List<QuestionModel> questions,
  ) async {
    int i = 0;
    QuestionModel question;
    List<QuestionModel> currentQuestions = questions;

    while(questionsGenerated != totalOfQuestions) {
      if (i == moduleTopics.length) {
        i = 0;
      }

      do {
        question = (await _getQuestionsFromTopic(examModule, moduleTopics[i], 1))[0];
      } while(currentQuestions.contains(question));

      currentQuestions.add(question);
      questionsGenerated++;
      i++;
    }

    return currentQuestions;
  }

  static Future<List<QuestionModel>> _getQuestionsFromTopic(String examModule, String moduleTopic, int questionsNum) async {
    List<QuestionModel> questions = await DBProvider.db.getQuestions(examModule, moduleTopic);
    List<QuestionModel> finalQuestions = [];
    Random random = Random();
    int questionIndex = 0;

    for(int i = 0; i < questionsNum; i++) {
      questionIndex = random.nextInt(questions.length);
      finalQuestions.add(questions.removeAt(questionIndex));
    }

    return finalQuestions;
  }

  static ExamResult evaluateExam(List<ModuleQuestions> modulesQuestions) {
    List<ModuleResult> modulesResult = [];
    ModuleResult moduleResult;
    int totalScore = 0;

    for(ModuleQuestions moduleQuestions in modulesQuestions) {
      moduleResult = _evaluateModule(moduleQuestions);
      totalScore += moduleResult.score;
      modulesResult.add(moduleResult);
    }

    return ExamResult(modulesResult, totalScore);
  }

  static ModuleResult _evaluateModule(ModuleQuestions moduleQuestions) {
    List<ExamQuestion> questions = moduleQuestions.questions;
    int selectedAnswerIndex = -1;
    int correctAnswerIndex = -1;
    int moduleScore = 0;

    for(ExamQuestion examQuestion in questions) {
      selectedAnswerIndex = examQuestion.answers.indexWhere((answer) => answer.isSelected);
      correctAnswerIndex = examQuestion.answers.indexWhere((answer) => answer.answer.isCorrect == Constants.trueSQLiteIntValue);

      if(selectedAnswerIndex == correctAnswerIndex) {
        moduleScore += 1;
      }
    }

    return ModuleResult(moduleQuestions.module, moduleScore);
  }
}