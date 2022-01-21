import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Registro EXAA II"),
      //),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade800, Colors.purple.shade300],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: FlatButton(
                onPressed: () {},
                child:
                    new Icon(Icons.arrow_back, color: Colors.white, size: 50),
                shape: new CircleBorder(),
                color: Colors.black12),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 93),
            child: Text(
              "Nueva Cuenta",
              style: GoogleFonts.monoton(
                textStyle: TextStyle(
                    fontSize: 42, color: Colors.white, letterSpacing: .5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 45),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Nombre usuario"),
                        ),
                        SizedBox(height: 13),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Ingresa correo"),
                        ),
                        SizedBox(height: 13),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Escribe contraseña"),
                          obscureText: true,
                        ),
                        SizedBox(height: 18),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          textColor: Colors.white,
                          onPressed: () => _register(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Registrarse"),
                              if (_loading)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
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
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
  }
}
