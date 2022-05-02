import 'package:exaa_2/utils/error_util.dart';
import 'package:flutter/material.dart';

class CommonDialog{
  static void dialog(
    BuildContext context,
    {
      Widget? title,
      required Widget content,
      required List<Widget> actions
    }
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
          title: title,
          content: SingleChildScrollView(child: content),
          actions: actions,
        );
      }
    );
  }

  static void waitDialog(
    BuildContext context,
    {
      Widget? title,
      required Widget content,
      required Future<dynamic> future,
      required void Function(dynamic) onSuccess,
      required void Function(dynamic) onError
    }
  ) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16.0),
                child: const CircularProgressIndicator(),
              ),
              Expanded(child: content)
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
        );
      }
    );

    await future.then(
      (value) {
        Navigator.pop(context);
        onSuccess.call(value);
      }
    )
    .catchError(
      (error) {
        Navigator.pop(context);
        onError.call(error);
      }
    );
  }

  static void info(BuildContext context, Widget title, Widget content, {required void Function() onAccept}) {
    dialog(
      context,
      title: title,
      content: content,
      actions: [
        TextButton(
          child: const Text('Aceptar'),
          onPressed: onAccept,
        ),
      ]
    );
  }

  static void confirm(
    BuildContext context,
    Widget content,
    {
      required void Function() onConfirm,
      required void Function() onCancel,
    }
  ) {
    dialog(
      context,
      content: content,
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: onCancel,
        ),
        TextButton(
          child: const Text('Si'),
          onPressed: onConfirm,
        ),
      ],
    );
  }

  static void error(BuildContext context, dynamic error) {
    dialog(
      context, 
      title: const Text('Error'),
      content: Text(ErrorUtil.message(error)),
      actions: [
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]
    );
  }

  static void customError(BuildContext context, String errorMessage) {
    dialog(
      context, 
      title: const Text('Error'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]
    );
  }

  static void modal(BuildContext context, {required Widget content}) {
    showDialog(
      context: context,
      builder: (context) {
        return content;
      },
    );
  }
}