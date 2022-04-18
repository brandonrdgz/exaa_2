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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
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
                          style: TextStyle(fontSize: 26.0, color: Colors.white),
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
}
