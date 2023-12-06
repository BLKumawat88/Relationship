import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class LineChart1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(AppCommonColor.appMainColor),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: false,
          horizontalInterval: 2,
          // verticalInterval: 2,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          show: true,
        ),
        borderData:
            FlBorderData(border: Border.all(color: Colors.white, width: 0.5)),
        lineBarsData: [
          // LineChartBarData(
          //   color: Colors.pink,
          //   // colors: lineColor,
          //   isCurved: true,
          //   spots: [
          //     FlSpot(1, 0),
          //     FlSpot(2, 0),
          //     FlSpot(3, 0),
          //     FlSpot(4, 0),
          //     FlSpot(5, 0),
          //     FlSpot(6, 0),
          //     FlSpot(7, 0),
          //     FlSpot(8, 0),
          //   ],
          // ),
          // LineChartBarData(
          //   color: Colors.green,
          //   // colors: lineColor,
          //   isCurved: true,
          //   spots: [
          //     FlSpot(1, 0.3),
          //     FlSpot(2, 0.3),
          //     FlSpot(3, 0.3),
          //     FlSpot(4, 0.3),
          //     FlSpot(5, 0.3),
          //     FlSpot(6, 0.3),
          //     FlSpot(7, 0.3),
          //     FlSpot(8, 0.3),
          //   ],
          // ),
        ],
        minX: 0,
        minY: 0,
        maxX: 10,
        maxY: 10,
        backgroundColor: Colors.white,
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;

  switch (value.toInt()) {
    case 1:
      text = Image.asset("assets/images/categorycommunication.png", width: 50);
      break;
    case 2:
      text = Image.asset("assets/images/resolving.png", width: 50);
      break;
    case 3:
      text = Image.asset("assets/images/affection.png", width: 50);
      break;
    case 4:
      text = Image.asset("assets/images/intative.png", width: 50);
      break;
    case 5:
      text = Image.asset("assets/images/listing.png", width: 50);
      break;
    case 6:
      text = Image.asset("assets/images/plalyful.png", width: 50);
      break;
    case 7:
      text = Image.asset("assets/images/responsibility.png", width: 50);
      break;
    case 8:
      text = Image.asset("assets/images/emotional.png", width: 50);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
