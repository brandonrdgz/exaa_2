import 'package:email_validator/email_validator.dart';
import 'package:exaa_2/models/users_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:exaa_2/utils/error.dart';
import 'package:exaa_2/widgets/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'initial_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade800,
                  Colors.deepPurple.shade300,
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 93),
            child: Text(
              "Nueva Cuenta",
              style: GoogleFonts.monoton(
                textStyle: const TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  letterSpacing: .5,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 45),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Nombre usuario"),
                            onChanged: (String username) {
                              _username = username;
                            },
                            validator: (String? username) {
                              if (username == null) {
                                return 'El nombre de usuario no es válido';
                              }
                            },
                          ),
                          const SizedBox(height: 13),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Ingresa correo"),
                            onChanged: (String email) {
                              _email = email;
                            },
                            validator: (String? email) {
                              if (email == null ||
                                  !EmailValidator.validate(email)) {
                                return 'El correo no es válido';
                              }
                            },
                          ),
                          const SizedBox(height: 13),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Escribe contraseña"),
                            obscureText: true,
                            onChanged: (String password) {
                              _password = password;
                            },
                            validator: (String? password) {
                              if (password == null || password.length < 6) {
                                return 'La contraseña debe de tener mínimo 6 caracteres';
                              }
                            },
                          ),
                          const SizedBox(height: 18),
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            textColor: Colors.white,
                            onPressed: (!agree)
                                ? null
                                : () {
                                    _register(context);
                                  },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Registrarse"),
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  child: Checkbox(
                                    value: agree,
                                    onChanged: (value) {
                                      setState(() {
                                        agree = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const Text(
                                  'He leído los',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                FlatButton(
                                  textColor: Theme.of(context).primaryColor,
                                  child: const Text("términos y condiciones"),
                                  onPressed: () async {
                                    if (!await launch(
                                        "https://moodle.toluca.tecnm.mx/"))
                                      throw 'Could not launch https://moodle.toluca.tecnm.mx/';
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("¿Ya tienes cuenta?"),
                              FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                child: const Text("Iniciar sesión"),
                                onPressed: () => _showLogin(context),
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

  void _register(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      CommonDialog.progressDialog(context,
          content: const Text('Registrando...'),
          future: Auth.register(_email, _password), onSuccess: (value) {
        setState(() {
          _loading = false;
        });

        CommonDialog.dialog(context,
            content: const Text('Registro exitoso'),
            actions: [
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, InitialPage.id);
                  UsersModel users =
                      UsersModel(email: _email, username: _username);
                  await DBProvider.db.insertUser(users);
                  //await DBProvider.db.getUsers();
                },
              ),
            ]);
      }, onError: (error) {
        setState(() {
          _loading = false;
        });

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

  void _showLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'login');
  }
}
