import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadísticas de Programas Académicos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  groupsSpace: 12,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) {
                        return TextStyle(color: Colors.black, fontSize: 14);
                      },
                      margin: 16,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Grupo A';
                          case 1:
                            return 'Grupo B';
                          case 2:
                            return 'Grupo C';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          y: 8,
                          colors: [Colors.blue],
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          y: 10,
                          colors: [Colors.green],
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          y: 6,
                          colors: [Colors.orange],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            PieChart(
              PieChartData(
                sectionsSpace: 5,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                    value: 30,
                    color: Colors.blue,
                    title: 'Grupo A',
                    radius: 60,
                  ),
                  PieChartSectionData(
                    value: 40,
                    color: Colors.green,
                    title: 'Grupo B',
                    radius: 60,
                  ),
                  PieChartSectionData(
                    value: 20,
                    color: Colors.orange,
                    title: 'Grupo C',
                    radius: 60,
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
