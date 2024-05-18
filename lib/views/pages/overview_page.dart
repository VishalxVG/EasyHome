import 'package:easyhome/consts/app_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(top: 15, right: 15),
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: BarChart(
              BarChartData(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(
                  drawVerticalLine: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 50,
                        color: Theme.of(context).colorScheme.primary,
                        width: 40,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 40,
                        color: Theme.of(context).colorScheme.primary,
                        width: 40,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 5,
                        color: Theme.of(context).colorScheme.primary,
                        width: 40,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  )
                ],
                alignment: BarChartAlignment.center,
                groupsSpace: 60,
                titlesData: const FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: getTitles,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: 20,
                    radius: 20,
                    titlePositionPercentageOffset: -1,
                    badgePositionPercentageOffset: 2,
                    badgeWidget: Image.asset(
                      AppImage.SHOPPING,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.yellow,
                    value: 40,
                    radius: 20,
                    titlePositionPercentageOffset: -1,
                    badgePositionPercentageOffset: 2,
                    badgeWidget: Image.asset(
                      AppImage.HOUSE,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.orange,
                    value: 70,
                    radius: 20,
                    titlePositionPercentageOffset: -1,
                    badgePositionPercentageOffset: 2,
                    badgeWidget: Image.asset(
                      AppImage.FOOD,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 50,
                    radius: 20,
                    titlePositionPercentageOffset: -1,
                    badgePositionPercentageOffset: 2,
                    badgeWidget: Image.asset(
                      AppImage.CAR,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.purpleAccent,
                    value: 10,
                    radius: 20,
                    titlePositionPercentageOffset: -1,
                    badgePositionPercentageOffset: 2,
                    badgeWidget: Image.asset(
                      AppImage.DOCTOR,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'INCOME';
      break;
    case 1:
      text = 'EXPENCES';
      break;
    case 2:
      text = 'LEFT';
      break;

    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}
