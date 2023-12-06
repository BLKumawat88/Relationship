import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class LineChartContent extends StatelessWidget {
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
          horizontalInterval: 1.7,
          // verticalInterval: 2,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                Widget text;
                const style = TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                );

                switch (value.toInt()) {
                  case 1:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 1)
                        ? Image.network(
                            provider.categoryForHomeScreen[0]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 2:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 2)
                        ? Image.network(
                            provider.categoryForHomeScreen[1]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 3:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 3)
                        ? Image.network(
                            provider.categoryForHomeScreen[2]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);
                    break;
                  case 4:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 4)
                        ? Image.network(
                            provider.categoryForHomeScreen[3]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 5:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 5)
                        ? Image.network(
                            provider.categoryForHomeScreen[4]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 6:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 6)
                        ? Image.network(
                            provider.categoryForHomeScreen[5]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 7:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 7)
                        ? Image.network(
                            provider.categoryForHomeScreen[6]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 8:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 8)
                        ? Image.network(
                            provider.categoryForHomeScreen[7]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 9:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 9)
                        ? Image.network(
                            provider.categoryForHomeScreen[8]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  case 10:
                    text = (provider.categoryForHomeScreen.isNotEmpty &&
                            provider.categoryForHomeScreen.length >= 10)
                        ? Image.network(
                            provider.categoryForHomeScreen[9]['icon'],
                            width: 50,
                          )
                        : const Text('', style: style);

                    break;
                  default:
                    text = const Text('', style: style);
                    break;
                }

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: text,
                );
              },
            ),
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
        lineBarsData: provider.lineChartBarData,
        minX: 0,
        minY: 0,
        maxX: provider.categoryForHomeScreen.length.toDouble(),
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
    case 9:
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
