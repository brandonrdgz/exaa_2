import 'package:email_validator/email_validator.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:exaa_2/utils/error.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter/material.dart';

import 'initial_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple.shade800,
                Colors.deepPurple.shade300,
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Row(
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
          ),
          Transform.translate(
            offset: const Offset(0, -10),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 200, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(labelText: "Correo:"),
                            onChanged: (String email) {
                              _email = email;
                            },
                            validator: (String? email) {
                              if (email == null || ! EmailValidator.validate(email)) {
                                return 'El correo no es válido';
                              }
                            },
                          ),
                          const SizedBox(height: 13),
                          TextFormField(
                            decoration: const InputDecoration(labelText: "Contraseña:"),
                            obscureText: true,
                            onChanged: (String password) {
                              _password = password;
                            },
                            validator: (String? password) {
                              if (password == null) {
                                return 'La contraseña no puede estar vacía';
                              }
                            },
                          ),
                          const SizedBox(height: 18),
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            textColor: Colors.white,
                            onPressed: () {
                              _login(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Iniciar sesión"),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("¿No estás registrado?"),
                              FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                child: const Text("Registrarse"),
                                onPressed: () => _showRegister(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      CommonDialog.progressDialog(
        context,
        content: const Text('Iniciando sesión...'),
        future: Auth.login(_email, _password),
        onSuccess: (value) {
          Navigator.pushReplacementNamed(context, InitialPage.id);
        },
        onError: (error) {
          setState(() {
            _loading = false;
          });

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

  void _showRegister(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'register');
  }
}