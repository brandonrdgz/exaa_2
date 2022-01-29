// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exaa_2/models/module_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/widgets/module_card.dart';
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
          Expanded(
              child: FutureBuilder(
            future: DBProvider.db.getModules(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ModuleModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ModuleCard(
                          snapshot.data![i].pathImage,
                          snapshot.data![i].name_module,
                          snapshot.data![i].description_module);
                    });
              } else {
                return Container(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )

              /*  children: <Widget>[
                ModuleCard('assets/design/math1.png', 'Pensamiento Matemático',
                    'Descripción breve del módulo'),
                ModuleCard('assets/design/calculus.jpg', 'Cálculo',
                    'Descripción breve del módulo'),
                ModuleCard('assets/design/physics.png', 'Física',
                    'Descripción breve del módulo'),
                ModuleCard('assets/design/gramatic_structure.jpg',
                    'Estructura de la lengua', 'Descripción breve del módulo'),
                ModuleCard('assets/design/lecture.jpg', 'Comprensión lectora',
                    'Descripción breve del módulo')
              ],*/
              ),

          /*Expanded(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 25),
                  height: 200,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                              color: Color(0xFF363f93).withOpacity(0.3),
                              offset: new Offset(-10, 0),
                              blurRadius: 20,
                              spreadRadius: 4)
                        ]),
                    padding:
                        const EdgeInsets.only(left: 32, top: 50, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'FÍSICA',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Estudia física',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 25),
                  height: 200,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                              color: Color(0xFF363f93).withOpacity(0.3),
                              offset: new Offset(-10, 0),
                              blurRadius: 20,
                              spreadRadius: 4)
                        ]),
                    padding:
                        const EdgeInsets.only(left: 32, top: 50, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CÁLCULO',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Estudia cálculo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))*/
        ],
      ),
    );
  }
}
