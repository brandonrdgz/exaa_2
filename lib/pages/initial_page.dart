import 'package:exaa_2/pages/about_page.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:exaa_2/widgets/rounded_icon_text_button.dart';
import 'package:exaa_2/utils/error.dart';
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
              Navigator.pushNamed(context, 'learning');
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
              Navigator.pushNamed(context, AboutPage.id);
            },
          ),
          RoundedIconTextButton(
            icon: FontAwesomeIcons.signOutAlt,
            iconSize: 40,
            text: 'Cerrar sesión',
            textSize: 40,
            onPressed: () {
              _logout(context);
            }
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    CommonDialog.progressDialog(
      context,
      content: const Text('Cerrando sesión...'),
      future: Auth.logout(),
      onSuccess: (value) {
        Navigator.pushReplacementNamed(context, 'login');
      },
      onError: (error) {
        CommonDialog.dialog(
          context,
          title: const Text('Error'),
          content: Text(Error.message(error)),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ] 
        );
      }
    );
  }
}
