import 'package:exaa_2/models/statistics/exam_detail_model.dart';
import 'package:exaa_2/models/statistics/exam_history_model.dart';
import 'package:exaa_2/utils/exams.dart';
import 'package:exaa_2/utils/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BarChartSample7 extends StatefulWidget {
  const BarChartSample7({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFFCCCCCC);
  //estos son las calificaciones de los modulos por examen

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  List dataList = [
    _BarData(Color(0xFFecb206), 0, 0), //0
    _BarData(Color(0xFFa8bd1a), 0, 0), //1
    _BarData(Color(0xFF17987b), 0, 0), //2
    _BarData(Color(0xFFb87d46), 0, 0), //3
    _BarData(Color(0xFF295ab5), 0, 0), //4
    _BarData(Colors.purple, 0, 0), //4
  ];
  @override
  void dispose() {
    Exams.examsDetail.clear();
    super.dispose();
  }

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartSample7.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    Exams.examsDetail.forEach((element) {
      print(element.id_exam);
      print(element.module_name);
    });
    
    List<ExamHistoryModel> examsList = Exams.exams;
    List<ExamDetailModel> dummy;

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
            Center(
              child: Column(
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
            ),
            Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Exams.exams.length,
                  itemBuilder: (BuildContext context, int i) {
                    dummy = Exams.examsDetail
                        .where((element) =>
                            element.id_exam == examsList[i].id_exam)
                        .toList();
                    int j = 0;
                    dummy.forEach((element) {
                      if (element.module_name.toString() == "Física") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 24;
                      } else if (element.module_name.toString() ==
                          "Estructura de la lengua") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 30;
                      } else if (element.module_name.toString() ==
                          "Comprensión Lectora") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 30;
                      } else if (element.module_name.toString() ==
                          "Pensamiento matemático") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 30;
                      } else if (element.module_name.toString() ==
                          "Pensamiento analítico verbal") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 30;
                      } else if (element.module_name.toString() == "Cálculo") {
                        dataList[j].value =
                            (element.score.toDouble() * 100) / 24;
                      }
                      j++;
                    });
                    List<String> dateExam =
                        examsList[i].date_answered.toString().split('T');
                    return Column(
                      children: [
                        Text('Fecha de aplicación de examen ' +
                            dateExam[0] +
                            '  ' +
                            examsList[i].id_exam.toString()),
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
                                                  color: dataList[index].color,
                                                  isSelected:
                                                      touchedGroupIndex ==
                                                          index,
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
                                          dataList.asMap().entries.map((e) {
                                        final index = e.key;
                                        final data = e.value;
                                        return generateBarGroup(
                                            index,
                                            data.color,
                                            data.value,
                                            data.shadowValue);
                                      }).toList(),
                                      maxY: 100,
                                      barTouchData: BarTouchData(
                                        enabled: true,
                                        handleBuiltInTouches: false,
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
                                                rod.toY.toString(),
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
                                        touchCallback: (event, response) {
                                          if (event
                                                  .isInterestedForInteractions &&
                                              response != null &&
                                              response.spot != null) {
                                            setState(() {
                                              touchedGroupIndex = response
                                                  .spot!.touchedBarGroupIndex;
                                            });
                                          } else {
                                            setState(() {
                                              touchedGroupIndex = -1;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class _BarData {
  final Color color;
  double value;
  final double shadowValue;
  void set valor(newValue) {
    value = newValue;
  }

  _BarData(this.color, this.value, this.shadowValue);
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  final Color color;
  final bool isSelected;

  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.grade : Icons.grade_outlined,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>;
  }
}