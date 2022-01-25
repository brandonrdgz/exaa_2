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
          content: content,
          actions: actions,
        );
      }
    );
  }

  static void progressDialog(
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

  static void modal(BuildContext context, {required Widget content}) {
    showDialog(
      context: context,
      builder: (context) {
        return content;
      },
    );
  }
}