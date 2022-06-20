import 'package:exaa_2/pages/about/about_page.dart';
import 'package:exaa_2/pages/agreement_page.dart';
import 'package:exaa_2/pages/exam/apply_exam_page.dart';
import 'package:exaa_2/pages/exam/exam_page.dart';
import 'package:exaa_2/pages/faq/frecuent_questions_page.dart';
import 'package:exaa_2/pages/exam/exam_result_page.dart';
import 'package:exaa_2/pages/initial_page.dart';
import 'package:exaa_2/pages/teaching_material/learning_page.dart';
import 'package:exaa_2/pages/login_page.dart';
import 'package:exaa_2/pages/statistics/statistics_page.dart';
import 'package:exaa_2/pages/teaching_material/subtopic_learning_page.dart';
import 'package:exaa_2/pages/teaching_material/content_page.dart';
import 'package:exaa_2/pages/teaching_material/topic_learning_page.dart';
import 'package:exaa_2/pages/register_page.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginPage(),
    'learning': (BuildContext context) => LearningPage(),
    'topicLearning': (BuildContext context) => TopicLearningPage(),
    'subtopicLearning': (BuildContext context) => SubtopicLearningPage(),
    'contentPage': (BuildContext context) => ContentPage(),
    InitialPage.id: (BuildContext context) => InitialPage(),
    'register': (BuildContext context) => RegisterPage(),
    AboutPage.id: (BuildContext context) => AboutPage(),
    ApplyExamPage.id: (BuildContext context) => ApplyExamPage(),
    ExamPage.id: (BuildContext context) => ExamPage(),
    'questions': (BuildContext context) => FrecuentQuestion(),
    'agreement': (BuildContext context) => AgreementPage(),
    'statistics': (BuildContext context) => StatisticsPage(),
    ExamResultPage.id: (BuildContext context) => ExamResultPage(),
  };
}
