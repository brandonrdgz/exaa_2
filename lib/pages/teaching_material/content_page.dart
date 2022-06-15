import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _htmlContent =
        ''; //Aquí se recibe el contenido y se guarda en la variable
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    _htmlContent = _arguments['content'];
    return Scaffold(
      body: Stack(children: <Widget>[
        SizedBox(height: 20),
        SafeArea(
          child: SingleChildScrollView(
            child: Html(
              data: _htmlContent,
              style: {
                'h3': Style(
                    width: 300,
                    backgroundColor: Colors.deepPurple.shade200,
                    margin: EdgeInsets.only(left: 45.0, right: 20.0),
                    border: Border.fromBorderSide(BorderSide(
                        color: Colors.deepPurple.shade900,
                        width: 5.0,
                        style: BorderStyle.solid)),
                    color: Colors.white,
                    fontSize: FontSize.percent(185),
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                    textDecorationStyle: TextDecorationStyle.wavy),
                'h4': Style(
                    width: 300,
                    backgroundColor: Colors.deepPurple.shade200,
                    margin: EdgeInsets.only(left: 45.0, right: 20.0),
                    border: Border.fromBorderSide(BorderSide(
                        color: Colors.deepPurple.shade900,
                        width: 5.0,
                        style: BorderStyle.solid)),
                    color: Colors.white,
                    fontSize: FontSize.percent(185),
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                    textDecorationStyle: TextDecorationStyle.wavy),
                'p': Style(
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 9, right: 9),
                    fontSize: FontSize.percent(100),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify),
                'ul': Style(
                    color: Colors.black,
                    padding: EdgeInsets.only(right: 6, left: 6),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    fontSize: FontSize.percent(100),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify),
                'body': Style(backgroundColor: Colors.deepPurple.shade50)
              },
            ),
          ),
        ),
      ]),
    );
  }
}
