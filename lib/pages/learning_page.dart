import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: color,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 20,
                  child: Text(
                    'Material didáctico',
                    style: TextStyle(fontSize: 30, color: color),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Container(
            height: 230,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: new Offset(-10, 10),
                                blurRadius: 20,
                                spreadRadius: 4.0)
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/design/math1.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 45,
                    left: 190,
                    child: Container(
                      height: 150,
                      width: 180,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Matemáticas',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            'En este apartado se ingresará toda la descripción del módulo',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
