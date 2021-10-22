import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:diary/components/graph_component.dart';
import 'package:diary/components/table_component.dart';

class GraphPage extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent
  ];

  @override
  State<StatefulWidget> createState() => _GraphPage();
}

class _GraphPage extends State<GraphPage> {

  int touchedIndex;
  dynamic touchCallback;

  final Duration animationDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    touchCallback = (barTouchResponse) {
      setState(() {
        if(barTouchResponse.spot != null && barTouchResponse.touchInput is! PointerUpEvent && barTouchResponse.touchInput is! PointerExitEvent) {
          touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
        }else {
          touchedIndex = -1;
        }
      });
    };

    List<String> questionOne = [
      'Que horas você foi para a cama?'
    ];

    List<String> questionTwo = [
      'Que horas você desligou as luzes para dormir?'
    ];

    List<String> questionThree = [
      'Quanto tempo você demorou para iniciar o sono?'
    ];

    List<String> questionFour = [
      'Quantas vezes você acordou na noite passada?'
    ];
    
    List<String> questionFive = [
      'Quanto tempo você ficou acordado ao longo da noite? (tempo total dos despertares.)'
    ];

    List<String> questionSix = [
      'Que horas você acordou pela manhã?'
    ];

    List<String> questionSeven = [
      'Que horas você se levantou da cama?'
    ];

    List<String> questionEight = [
      'Quantas horas você dormiu na noite passada?'
    ];

    GraphComponent graphComponent = GraphComponent(touchCallback, touchedIndex, '00:00', '12:00', '23:59', 5, 6.5, 5, 7.5, 9, 11.5);
    TableComponent tableComponent = TableComponent(questionOne, questionTwo, questionThree, questionFour, questionFive, questionSix, questionSeven, questionEight);

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xff81e5cd),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  tableComponent.mainTable(),

                  Text(
                    'Flutter',
                    style: TextStyle(
                      color: const Color(0xff0f4a3c),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    'Example',
                    style: TextStyle(
                      color: const Color(0xff379982),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(
                    height: 38,
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        graphComponent.mainBarData(),
                        swapAnimationDuration: animationDuration,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),      
    );
  }
}