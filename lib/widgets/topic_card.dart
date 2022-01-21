import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final String moduleName;
  final String topicName;
  const TopicCard(this.moduleName, this.topicName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
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
        padding: const EdgeInsets.only(left: 32, top: 50, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              moduleName,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              topicName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
