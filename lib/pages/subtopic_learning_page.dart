import 'package:exaa_2/daos/teaching_material/teaching_material_dao.dart';
import 'package:exaa_2/models/subtopic_model.dart';
import 'package:exaa_2/services/db_provider.dart';
import 'package:exaa_2/widgets/subtopic_card.dart';
import 'package:flutter/material.dart';

class SubtopicLearningPage extends StatelessWidget {
  const SubtopicLearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    //List<TopicModel> topics = _arguments['topics'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 230,
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
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
                    _arguments['name_topic'],
                    style: TextStyle(
                        fontSize: _arguments['font_size'], color: color),
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
            future: TeachingMaterialDao().getSubtopicByTopic(_arguments['name_topic']),
            builder: (BuildContext context,
                AsyncSnapshot<List<SubtopicModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int i) {
                      return SubtopicCard(
                          snapshot.data![i].name_subtopic,
                          snapshot.data![i].name_topic,
                          snapshot.data![i].content_subtopic);
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
          )),
          /*Expanded(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, i) {
                return TopicCard(topics[i].name_module, topics[i].name_topic);
              },
            ),
            /*child: ListView(
              children: <Widget>[
                TopicCard(_arguments['name_module'], 'Álgebra')
              ],
            ),*/
          ))*/
        ],
      ),
    );
  }
}
