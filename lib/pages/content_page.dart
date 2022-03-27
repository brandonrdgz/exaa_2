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
                'h1': Style(
                    backgroundColor: Colors.deepPurple.shade200,
                    border: Border.fromBorderSide(BorderSide(
                        color: Colors.deepPurple.shade900,
                        width: 5.0,
                        style: BorderStyle.solid)),
                    color: Colors.white,
                    fontSize: FontSize.percent(195),
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    textDecoration: TextDecoration.underline,
                    textDecorationStyle: TextDecorationStyle.wavy),
                'p': Style(
                    color: Colors.black,
                    fontSize: FontSize.percent(125),
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.justify),
                'ul': Style(
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    fontSize: FontSize.percent(125),
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.justify),
                'body': Style(
                    backgroundColor: Colors.deepPurple.shade50)
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
