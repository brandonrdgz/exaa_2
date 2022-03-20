import 'package:exaa_2/pages/initial_page.dart';
import 'package:flutter/material.dart';

class Alerts {
  static showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, InitialPage.id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alerta"),
      content: Text(
          "¡La carga de datos ha sido exitosa!\nSe requiere volver a la pantalla inicial para reflejar los cambios."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
