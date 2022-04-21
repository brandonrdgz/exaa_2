// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:exaa_2/models/frecuent_question_model.dart';
import 'package:exaa_2/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FrecuentQuestion extends StatefulWidget {
  FrecuentQuestion({Key? key}) : super(key: key);

  @override
  State<FrecuentQuestion> createState() => _FrecuentQuestionState();
}

class _FrecuentQuestionState extends State<FrecuentQuestion> {
  List? contentList, generalList, howToUseTheAppList, conectionList;
  List<FrecuentQuestionModel> renderList = [];
  List<FrecuentQuestionModel> questions = [
    FrecuentQuestionModel(
        question: '¿Cómo estudiar un tema?',
        answer:
            'Para estudiar un tema antes de presentar un exámen se debe de ir al módulo de "Material didáctico"',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question:
            '¿Para presentar un examen es necesario estudiar un tema del módulo de "Material didáctico"?',
        answer:
            'No es necesario, prepararse previo al exámen con el material didáctico proporcionado, esto es opcional.',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Qué es EXAA II?',
        answer:
            'Es una aplicación que permite a los usuarios preparse para sus exámenes de ingreso a la universidad a partir de un material didáctico y exámenes de simulación.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question: '¿Test1?', answer: 'Test1"', category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Test2?', answer: 'Test2', category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question: '¿Test3?', answer: 'Test3"', category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: '¿Test4?', answer: 'Test4', category: 'Conexión'),
    FrecuentQuestionModel(
        question:
            '¿Es necesario contar con una conexión a internet para usar la app?',
        answer:
            'Sí, es necesario contar con una conexión a internet para poder ingresar a esta.',
        category: 'Conexión'),
    FrecuentQuestionModel(
        question: '¿Test6?', answer: 'Test6"', category: '¿Cómo usar la app?'),
  ];
  String title = 'Preguntas Frecuentes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildDrawerHeader(),
              _buildDrawerItem(
                  icon: Icons.question_answer_sharp,
                  text: 'Preguntas generales',
                  onTap: () {
                    renderList = questions
                        .where((element) =>
                            element.category == 'Preguntas generales')
                        .toList();
                    title = 'Preguntas generales';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.menu_book_rounded,
                  text: 'Contenido',
                  onTap: () {
                    renderList = questions
                        .where((element) => element.category == 'Contenido')
                        .toList();
                    title = 'Contenido';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.clear_all_sharp,
                  text: '¿Cómo usar la app?',
                  onTap: () {
                    renderList = questions
                        .where((element) =>
                            element.category == '¿Cómo usar la app?')
                        .toList();
                    title = '¿Cómo usar la app?';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.network_cell,
                  text: 'Conexión',
                  onTap: () {
                    renderList = questions
                        .where((element) => element.category == 'Conexión')
                        .toList();
                    title = 'Conexión';
                    setState(() {});
                  }),
              Divider(),
              _buildDrawerItem(
                  icon: Icons.contact_phone,
                  text: 'Acerca de',
                  onTap: () => {Navigator.pushNamed(context, AboutPage.id)}),
              ListTile(
                title: Text('Versión 1.0'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: 26.0, color: Colors.deepPurple.shade500)),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: (renderList.isEmpty)
                    ? questions.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.deepPurple.shade800,
                                          Colors.deepPurple.shade300,
                                        ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: Colors.deepPurple.shade900,
                                        child: Center(
                                          child: Text(i.question,
                                              style: TextStyle(
                                                fontSize: 26.0,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 18, left: 18, top: 20),
                                      child: Center(
                                        child: Text(
                                          i.answer,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }).toList()
                    : renderList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.deepPurple.shade800,
                                          Colors.deepPurple.shade300,
                                        ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: Colors.deepPurple.shade900,
                                        child: Center(
                                          child: Text(i.question,
                                              style: TextStyle(
                                                fontSize: 26.0,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 18, left: 18, top: 20),
                                      child: Center(
                                        child: Text(
                                          i.answer,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }).toList(),
              )
            ],
          ),
        ));
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/design/drawerBackground.jpg'))),
        // ignore: prefer_const_literals_to_create_immutables
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Text("Categorías más preguntadas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
