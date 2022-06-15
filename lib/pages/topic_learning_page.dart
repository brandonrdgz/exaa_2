import 'package:exaa_2/daos/teaching_material/teaching_material_dao.dart';
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
    int _size = 0;
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
                    _arguments['name_module'],
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
            future: TeachingMaterialDao().getTopicByModule(_arguments['name_module']),
            builder: (BuildContext context,
                AsyncSnapshot<List<TopicModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int i) {
                      (snapshot.data![i].name_topic ==
                              'EL ESTABLECIMIENTO DE INTERPRETACIONES DE RAZONAMIENTOS LÓGICOS Y ANALÓGICOS')
                          ? _size = 11
                          : _size = 18;
                      return TopicCard(
                          snapshot.data![i].name_module,
                          snapshot.data![i].name_topic,
                          snapshot.data![i].description_topic,
                          _size);
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
         
        ],
      ),
    );
  }
}
