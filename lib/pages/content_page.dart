// ignore_for_file: prefer_const_constructors

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
                'h1': Style(color: Colors.red, textAlign: TextAlign.center),
                'h3': Style(textShadow: [
                  Shadow(
                    offset: Offset(20.0, 15.0),
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
                'p': Style(
                  color: Colors.black87,
                  fontSize: FontSize.medium,
                  textAlign: TextAlign.justify,
                  padding: EdgeInsets.only(right: 10, left: 10),
                ),
                'ul': Style(margin: EdgeInsets.symmetric(vertical: 20))
              },
            ),
          ),
        ),
      ]),
    );
  }

  /*
  final _htmlContent = """
  <div>
    <h1>This is a title</h1>
    <p>This is a <strong>paragraph</strong>.</p>
    <p>I like <i>dogs</i></p>
    <p>Red text</p>
    <ul>
        <li>List item 1</li>
        <li>List item 2</li>
        <li>List item 3</li>
    </ul>
    <img src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' />
  </div>
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Html(
            data: _htmlContent,
            // Styling with CSS (not real CSS)
            style: {
              'h1': Style(color: Colors.red),
              'p': Style(color: Colors.black87, fontSize: FontSize.medium),
              'ul': Style(margin: EdgeInsets.symmetric(vertical: 20))
            },
          ),
        ),
      ),
    );
  }
  */
}
