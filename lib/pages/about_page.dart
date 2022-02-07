import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  static const String id = 'AboutPage';

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade800,
                Colors.deepPurple.shade300,
              ]
            )
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/Logo1.png",
                    color: Colors.white,
                  ),
                  Image.asset(
                    "assets/img/Logo2.png",
                  ),
                ],
              ),
              //Text('EXA II'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.school),
                    title: Text('Institución'),
                    subtitle: Text('Instituto Tecnológico de Toluca'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.userAlt),
                    title: Text('Lider de proyecto'),
                    subtitle: Text('Dra. Maribel Miranda Estevez'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.users),
                        title: Text('Colaboradores'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Eduardo Dominguez Cordero'),
                            Text('Brandon Ivan Rodriguez Duarte'),
                            Text('Jaquelin Milagros Jardon García'),
                            Text('Oswaldo Estrada Cardenas'),
                            Text('Susana Ivett Arzate Hernández'),
                            Text('Gabriel Villafaña Goméz'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.hashtag),
                    title: Text('Versión'),
                    subtitle: Text('1.0'),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}