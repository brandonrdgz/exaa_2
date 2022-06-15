import 'package:flutter/material.dart';

class SubtopicCard extends StatelessWidget {
  final String subtopicName;
  final String topicName;
  final String content;
  const SubtopicCard(this.subtopicName, this.topicName, this.content,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'contentPage',
            arguments: <String, dynamic>{'content': content});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 25),
        height: 200,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
          padding: const EdgeInsets.only(left: 32, top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subtopicName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
