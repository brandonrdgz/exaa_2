// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:exaa_2/models/frecuent_question_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FrecuentQuestion extends StatefulWidget {
  FrecuentQuestion({Key? key}) : super(key: key);

  @override
  State<FrecuentQuestion> createState() => _FrecuentQuestionState();
}

class _FrecuentQuestionState extends State<FrecuentQuestion> {
  List<FrecuentQuestionModel> questions = [
    FrecuentQuestionModel(question: 'Hola', id: 1)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildDrawerHeader(),
              _buildDrawerItem(icon: Icons.home, text: 'Home', onTap: () => {}),
              _buildDrawerItem(
                  icon: Icons.account_circle, text: 'Profile', onTap: () => {}),
              _buildDrawerItem(
                  icon: Icons.movie, text: 'Movies', onTap: () => {}),
              Divider(),
              _buildDrawerItem(
                  icon: Icons.contact_phone,
                  text: 'Contact Info',
                  onTap: () => {}),
              ListTile(
                title: Text('App versión 1.0.0'),
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
                child: Text("Preguntas frecuentes",
                    style: TextStyle(
                        fontSize: 26.0, color: Colors.deepPurple.shade500)),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5].map((i) {
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
                          child: Center(
                            child: Text(
                              'hola $i',
                              style: TextStyle(
                                  fontSize: 26.0, color: Colors.white),
                            ),
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
              child: Text("Categorías mas preguntadas",
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
