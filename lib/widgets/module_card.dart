import 'package:exaa_2/models/topic_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/utils/list_of_topics.dart';
import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final String imagePath;
  final String moduleTitle;
  final String moduleDescription;
  const ModuleCard(this.imagePath, this.moduleTitle, this.moduleDescription,
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
        (moduleTitle == 'PENSAMIENTO MATEMÁTICO' ||
                moduleTitle == 'ESTRUCTURA DE LA LENGUA' ||
                moduleTitle == 'COMPRENSIÓN LECTORA')
            ? _fontSize = 20
            : _fontSize = 30;
        Navigator.pushNamed(context, 'topicLearning',
            arguments: <String, dynamic>{
              'name_module': moduleTitle,
              'font_size': _fontSize
            });
      },
      child: Container(
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
                      image: AssetImage(this.imagePath),
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
                        this.moduleTitle,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF363f93),
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                        this.moduleDescription,
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
      ),
    );
  }
}
