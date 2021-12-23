import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';
import '../widgets/widgets.dart';

class FinanceNav extends StatelessWidget {
  const FinanceNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppDefault.defaultBorderRadiusOnly(),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          CaupeTitleWidget(title: 'Financial Summary').withBottomPadding(),
          CaupeSummary(
            total: 'R\$200,00',
            meta: '90%',
            document: '118.336.874-77',
          ),
          AppDefault.defaultSpaceHeight(height: 20),
          CaupeTitleWidget(title: 'Daily Chart').withBottomPadding(),
          DailyChart(),
          AppDefault.defaultSpaceHeight(height: 20),
          IntrinsicWidth(
            child: Container(
              width: double.maxFinite,
              height: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: AppDefault.defaultBorderRadius(),
                color: Color(0xff303030),
              ),
              child: LineChart(mainData()),
            ),
          ),
          AppDefault.defaultSpaceHeight(height: 20),
          CaupeTitleWidget(title: 'Mothly Chart').withBottomPadding(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: AppDefault.hPadding, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: AppDefault.defaultBorderRadius(),
              boxShadow: AppDefault.defaultBoxShadow(),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: 12,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) => MonthlyChart(
                month: 'January',
                percent: 0.7,
                value: 'R\$4,00',
              ),
            ),
          ).withAllPadding(),
          SizedBox(height: 80),
        ],
      ).withTopPadding(topPadding: 10).withSymPadding(),
    );
  }
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (_, value) => const TextStyle(
          color: Color(0xFFE2E2E2),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (_, value) => const TextStyle(
          color: Color(0xFFDDE0E2),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        colors: [
          const Color(0xff634A8C),
          const Color(0xff92278F),
        ],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            const Color(0xff634A8C),
            const Color(0xff92278F),
          ].map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
