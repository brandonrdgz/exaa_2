import 'package:exaa_2/pages/dummy_pages.dart';
import 'package:exaa_2/pages/initial_page.dart';
import 'package:exaa_2/pages/learning_page.dart';
import 'package:exaa_2/pages/login_page.dart';
import 'package:exaa_2/pages/topic_learning_page.dart';
import 'package:exaa_2/pages/register_page.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginPage(),
    'learning': (BuildContext context) => LearningPage(),
    'topicLearning': (BuildContext context) => TopicLearningPage(),
    InitialPage.id: (BuildContext context) => InitialPage(),
    'register': (BuildContext context) => RegisterPage(),
    'dummy': (BuildContext context) => DummyPage()
  };
}
