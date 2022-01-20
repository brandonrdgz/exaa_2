// ignore_for_file: prefer_const_declarations

import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class TopicLearningPage extends StatelessWidget {
  const TopicLearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    List<TopicModel> topics = _arguments['topics'];
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
                    _arguments['moduleName'],
                    style: TextStyle(
                        fontSize: _arguments['fontSize'], color: color),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Expanded(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, i) {
                return TopicCard(topics[i].moduleName, topics[i].topicName);
              },
            ),
            /*child: ListView(
              children: <Widget>[
                TopicCard(_arguments['moduleName'], 'Álgebra')
              ],
            ),*/
          ))
        ],
      ),
    );
  }
}
