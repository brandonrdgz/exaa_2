import 'package:exaa_2/daos/statistics/statistics_dao.dart';
import 'package:exaa_2/models/statistics/exam_detail_model.dart';
import 'package:exaa_2/models/statistics/exam_history_model.dart';
import 'package:exaa_2/services/firebase/auth.dart';
import 'package:exaa_2/utils/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFFCCCCCC);
  //estos son las calificaciones de los modulos por examen

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  BarChartGroupData _generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }

  final Future<List<Map<Object, Object>>> _examHistoryFuture = StatisticsDao().getExamsHistory(Auth.getEmail());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Text("Historial de calificaciones por exámen",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Indicator(
                  color: Color(0xFFecb206),
                  text: 'Física',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xFFa8bd1a),
                  text: 'Estructura de la lengua',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: (Color(0xFF17987b)),
                  text: 'Comprensión lectora',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xFFb87d46),
                  text: 'Pensamiento matemático',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xFF295ab5),
                  text: 'Pensamiento analítico verbal',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Cálculo',
                  isSquare: true,
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: FutureBuilder<List<Map<Object, Object>>>(
                  future: _examHistoryFuture,
                  builder: (BuildContext buildContext, AsyncSnapshot<List<Map<Object, Object>>> snapshot) {
                    Widget futureWidget;

                    if(snapshot.hasData) {
                      futureWidget = _chartListView(snapshot.data!);
                    }
                    else if(snapshot.hasError) {
                      futureWidget = Text('Error: ${snapshot.error}');
                    }
                    else {
                      futureWidget = CircularProgressIndicator();
                    }

                    return futureWidget;
                  },
                ),
                ),
          ],
        ),
      ),
    );
  }

  ListView _chartListView(List<Map<Object, Object>> examsHistory) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: examsHistory.length,
      itemBuilder: (BuildContext context, int i) {
        List<ExamDetailModel> examDetailsList = examsHistory[i]['examDetails'] as List<ExamDetailModel>;
        List<_BarData> chartBarsData = [
           _BarData(Color(0xFFecb206), 0),
          _BarData(Color(0xFFa8bd1a), 0),
          _BarData(Color(0xFF17987b), 0),
          _BarData(Color(0xFFb87d46), 0),
          _BarData(Color(0xFF295ab5), 0),
          _BarData(Colors.purple, 0),
        ];

        for(ExamDetailModel examDetails in examDetailsList) {
          if (examDetails.module_name.toString() == "Física") {
            chartBarsData[0].value =
                (examDetails.score.toDouble() * 100) / 24;
          } else if (examDetails.module_name.toString() ==
              "Estructura de la lengua") {
            chartBarsData[1].value =
                (examDetails.score.toDouble() * 100) / 30;
          } else if (examDetails.module_name.toString() ==
              "Comprensión Lectora") {
            chartBarsData[2].value =
                (examDetails.score.toDouble() * 100) / 30;
          } else if (examDetails.module_name.toString() ==
              "Pensamiento matemático") {
            chartBarsData[3].value =
                (examDetails.score.toDouble() * 100) / 30;
          } else if (examDetails.module_name.toString() ==
              "Pensamiento analítico verbal") {
            chartBarsData[4].value =
                (examDetails.score.toDouble() * 100) / 30;
          } else if (examDetails.module_name.toString() == "Cálculo") {
            chartBarsData[5].value =
                (examDetails.score.toDouble() * 100) / 24;
          }
        }
        List<String> dateExam =
            (examsHistory[i]['exam'] as ExamHistoryModel).date_answered.toString().split('T');
        return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8,),
          child: Column(
            children: [
              Text('Fecha de aplicación de examen ' +
                  dateExam[0] +
                  '  ' +
                  (examsHistory[i]['exam'] as ExamHistoryModel).id_exam.toString()),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.4,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceBetween,
                            borderData: FlBorderData(
                              show: true,
                              border: const Border.symmetric(
                                horizontal: BorderSide(
                                  color: Color(0xFFececec),
                                ),
                              ),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(
                                drawBehindEverything: true,
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF606060),
                                      ),
                                      textAlign: TextAlign.left,
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 36,
                                  getTitlesWidget: (value, meta) {
                                    final index = value.toInt();
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0),
                                      child: _IconWidget(
                                        color: chartBarsData[index].color,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              rightTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                            ),
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) =>
                                  FlLine(
                                color: const Color(0xFFececec),
                                dashArray: null,
                                strokeWidth: 1,
                              ),
                            ),
                            barGroups:
                                chartBarsData.asMap().entries.map((e) {
                              final index = e.key;
                              final data = e.value;
                              return _generateBarGroup(
                                  index,
                                  data.color,
                                  data.value,);
                            }).toList(),
                            maxY: 100,
                            barTouchData: BarTouchData(
                              enabled: false,
                              touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.transparent,
                                  tooltipMargin: 0,
                                  getTooltipItem: (
                                    BarChartGroupData group,
                                    int groupIndex,
                                    BarChartRodData rod,
                                    int rodIndex,
                                  ) {
                                    return BarTooltipItem(
                                      _yAxisStringValue(rod.toY),
                                      TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: rod.color!,
                                          fontSize: 18,
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black26,
                                              blurRadius: 12,
                                            )
                                          ]),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _yAxisStringValue(double value) {
    String stringValue;

    if(value % 1 == 0) {
      stringValue = value.toInt().toString();
    }
    else {
      stringValue = value.toStringAsFixed(2);
    }

    return stringValue;
  }
}

class _BarData {
  final Color color;
  double value;

  _BarData(this.color, this.value);
}

class _IconWidget extends StatelessWidget {
  final Color color;

  const _IconWidget({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.grade_outlined,
      color: color,
      size: 28,
    );
  }
}