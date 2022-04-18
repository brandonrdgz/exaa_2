import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/pages/about_page.dart';
import 'package:exaa_2/pages/apply_exam_page.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:exaa_2/utils/sql_data.dart';
import 'package:exaa_2/widgets/alerts.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:exaa_2/widgets/rounded_icon_text_button.dart';
import 'package:exaa_2/utils/error.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialPage extends StatefulWidget {
  static const String id = 'InitialPage';

  InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  SqlData sql = new SqlData();

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
              Navigator.pushNamed(context, ApplyExamPage.id);
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
            icon: FontAwesomeIcons.question,
            iconSize: 40,
            text: 'Preguntas frecuentes',
            textSize: 40,
            onPressed: () {
              Navigator.pushNamed(context, 'questions');
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
          /*FutureBuilder(
            future: DBProvider.db.getModules(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ModuleModel>> snapshot) {
              if (!snapshot.hasData) {
                return SizedBox();
              } else {
                return RoundedIconTextButton(
                  icon: FontAwesomeIcons.download,
                  iconSize: 40,
                  text: 'Cargar contenido de estudio',
                  textSize: 30,
                  onPressed: () async {
                    await sql.loadAllData();
                    Alerts.showAlertDialog(context);
                    setState(() {});
                  },
                );
              }
            },
          ),*/
          RoundedIconTextButton(
              icon: FontAwesomeIcons.signOutAlt,
              iconSize: 40,
              text: 'Cerrar sesión',
              textSize: 40,
              onPressed: () {
                _logout(context);
              }),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    CommonDialog.progressDialog(context,
        content: const Text('Cerrando sesión...'),
        future: Auth.logout(), onSuccess: (value) {
      Navigator.pushReplacementNamed(context, 'login');
    }, onError: (error) {
      CommonDialog.dialog(context,
          title: const Text('Error'),
          content: Text(Error.message(error)),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]);
    });
  }
}
