import 'package:exaa_2/pages/initial_page.dart';
import 'package:exaa_2/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _getInitialRoute() {
    String route = 'login';
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      route = InitialPage.id;
    }

    return route;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXAA II',
      initialRoute: _getInitialRoute(),
      routes: Routes.routes,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}