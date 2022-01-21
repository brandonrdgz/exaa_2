import 'package:exaa_2/utils/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXAA II',
      initialRoute: 'login',
      //initialRoute: 'register',
      routes: Routes.routes,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
