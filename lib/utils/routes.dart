import 'package:exaa_2/pages/initial_page.dart';
import 'package:exaa_2/pages/login_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginPage(),
    InitialPage.id : (BuildContext context) => InitialPage(),
  };
}
