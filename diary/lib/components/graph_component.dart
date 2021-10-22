import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphComponent {

  final Color barBackgroundColor = const Color(0xff72d8bf);
  
  int touchedIndex;
  dynamic touchCallback;

  String dataOne;
  String dataTwo;
  String dataThree;

  double pointMin;
  double pointMax;
  double pointMed;
  double pointDp;
  double pointBed;
  double pointEs;

  GraphComponent(this.touchCallback, this.touchedIndex, this.dataOne, this.dataTwo, this.dataThree, this.pointMin, this.pointMax, this.pointMed, this.pointDp, this.pointBed, this.pointEs);

  BarChartGroupData makeGroupData(
    int x,
    double y, {
      bool isTouched = false,
      Color barColor = Colors.white,
      double width = 22,
      List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        )
      ],

      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (index) {
    switch(index) {
      case 0:
        return makeGroupData(0, pointMin, isTouched: index == touchedIndex);

      case 1:
        return makeGroupData(1, pointMax, isTouched: index == touchedIndex);

      case 2:
        return makeGroupData(2, pointMed, isTouched: index == touchedIndex);

      case 3:
        return makeGroupData(3, pointDp, isTouched: index == touchedIndex);

      case 4:
        return makeGroupData(4, pointBed, isTouched: index == touchedIndex);

      case 5:
        return makeGroupData(5, pointEs, isTouched: index == touchedIndex);

      default:
        return null;
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;

            switch(group.x.toInt()) {
              case 0:
                weekDay = 'Mínimo';
                break;

              case 1:
                weekDay = 'Máximo';
                break;

              case 2:
                weekDay = 'Média';
                break;

              case 3:
                weekDay = 'Desvio Padrão';
                break;

              case 4:
                weekDay = 'Tempo de Cama';
                break;

              case 5:
                weekDay = 'Estimativa de Sono';
                break;
            }

            return BarTooltipItem(
              weekDay + '\n',
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),

              children: <TextSpan>[
                TextSpan(
                  text: (rod.y - 1).toString(),
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            );
          }),

      touchCallback: touchCallback,
      ),

      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch(value.toInt()) {
              case 0:
                return 'Min';
              
              case 1:
                return 'Max';

              case 2:
                return 'Med';

              case 3:
                return 'DP';

              case 4:
                return 'Cama';

              case 5:
                return 'ES';

              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
              if(value == 0) {
                return dataOne;
              }else if(value == 11) {
                 return dataTwo;
              }else if(value == 19) {
                return dataThree;
              }else {
                return '';
              }
          },
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10
          )
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}