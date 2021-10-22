import 'package:flutter/material.dart';

class TableComponent {

  List<String> questionOne;
  List<String> questionTwo;
  List<String> questionThree;
  List<String> questionFour;
  List<String> questionFive;
  List<String> questionSix;
  List<String> questionSeven;
  List<String> questionEight;

  TableComponent(this.questionOne, this.questionTwo, this.questionThree, this.questionFour, this.questionFive, this.questionSix, this.questionSeven, this.questionEight);

  Widget mainTable() {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
        columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Pergunta',
                style: TextStyle(fontStyle: FontStyle.italic)
              )
            ),
            DataColumn(
              label: Text(
                'Mínimo',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            DataColumn(
              label: Text(
                'Máximo',
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            ),

            DataColumn(
              label: Text(
                'Média',
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            ),

            DataColumn(
              label: Text(
                'DP',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            DataColumn(
              label: Text(
                'TTNC',
                style: TextStyle(fontStyle: FontStyle.italic)
              ),
            ),

            DataColumn(
              label: Text(
                'ES',
                style: TextStyle(fontStyle: FontStyle.italic)
              ),
            ),
          ],

          rows: <DataRow> [
            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionOne[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionTwo[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionThree[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionFour[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionFive[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionSix[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionSeven[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('')),
              ]
            ),

            DataRow(
              cells: <DataCell> [
                DataCell(Text(questionEight[0])),
                DataCell(Text('22:03')),
                DataCell(Text('22:07')),
                DataCell(Text('22:00')),
                DataCell(Text('22:07')),
                DataCell(Text('22:03')),
                DataCell(Text('22')),
              ]
            ),
          ],
        ),
      ),
    );
  }
}