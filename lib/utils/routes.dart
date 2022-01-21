import 'package:exaa_2/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'register': (BuildContext context) => RegisterPage()
  };
}
