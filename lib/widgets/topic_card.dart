import 'package:exaa_2/models/subtopic_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final String moduleName;
  final String topicName;
  final String descriptionTopic;
  final int sizeTitle;
  const TopicCard(
      this.moduleName, this.topicName, this.descriptionTopic, this.sizeTitle,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    double _fontSize;
    return GestureDetector(
      onTap: () async {
        (topicName == 'PUNTUACIÓN' ||
                topicName ==
                    'EL ESTABLECIMIENTO DE INTERPRETACIONES DE RAZONAMIENTOS LÓGICOS Y ANALÓGICOS' ||
                topicName ==
                    'EL ESTABLECIMIENTO DE RELACIONES ENTRE PALABRAS Y FRASES SINÓNIMAS Y ANTÓNIMAS')
            ? _fontSize = 20
            : _fontSize = 30;
        List<SubtopicModel> res =
            await DBProvider.db.getSubtopicByTopic(topicName);
        //print(res);
        Navigator.pushNamed(context, 'subtopicLearning',
            arguments: <String, dynamic>{
              'name_module': topicName,
              'font_size': _fontSize
            });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 25),
        height: 200,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
              color: color,
              // ignore: prefer_const_constructors
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              boxShadow: [
                // ignore: unnecessary_new
                new BoxShadow(
                    color: Color(0xFF363f93).withOpacity(0.3),
                    offset: new Offset(-10, 0),
                    blurRadius: 20,
                    spreadRadius: 4)
              ]),
          padding: const EdgeInsets.only(left: 32, top: 50, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                topicName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeTitle.toDouble(),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                descriptionTopic,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
