import 'package:exaa_2/widgets/rounded_icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialPage extends StatelessWidget {
  static const String id = 'InitialPage';

  InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXA II'),
      ),
      body: ListView(
        children: [
          RoundedIconTextButton(
            icon: FontAwesomeIcons.graduationCap,
            iconSize: 40,
            text: 'Aplicar un examen',
            textSize: 40,
            onPressed: () {
              //TODO: Show page 'Aplicar un examen'
            },
          ),
          RoundedIconTextButton(
            icon: FontAwesomeIcons.book,
            iconSize: 40,
            text: 'Material didáctico',
            textSize: 40,
            onPressed: () {
              //TODO: Show page 'Material didactico'
            },
          ),
          RoundedIconTextButton(
            icon: FontAwesomeIcons.chartLine,
            iconSize: 40,
            text: 'Estadísticas',
            textSize: 40,
            onPressed: () {
              //TODO: Show page 'Estadisticas'
            },
          ),
          RoundedIconTextButton(
            icon: FontAwesomeIcons.infoCircle,
            iconSize: 40,
            text: 'Acerca de',
            textSize: 40,
            onPressed: () {
              //TODO: Show page 'Acerca de'
            },
          ),
        ],
      ),
    );
  }
}