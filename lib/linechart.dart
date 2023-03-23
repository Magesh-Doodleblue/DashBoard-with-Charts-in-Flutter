/// Example of a line chart with null measure values.
///
/// Null values will be visible as gaps in lines and area skirts. Any data
/// points that exist between two nulls in a line will be rendered as an
/// isolated point, as seen in the green series.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleNullsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const SimpleNullsLineChart(this.seriesList, {super.key, this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleNullsLineChart.withSampleData() {
    return SimpleNullsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(animate: null);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      LinearSales(0, 5),
      LinearSales(1, 15),
      LinearSales(2, 18),
      LinearSales(3, 75),
      LinearSales(4, 100),
      LinearSales(5, 90),
      LinearSales(6, 75),
    ];

    final myFakeTabletData = [
      LinearSales(0, 10),
      LinearSales(1, 30),
      LinearSales(2, 50),
      LinearSales(3, 150),
      LinearSales(4, 200),
      LinearSales(5, 180),
      LinearSales(6, 150),
    ];

    final myFakeMobileData = [
      LinearSales(0, 15),
      LinearSales(1, 45),
      LinearSales(2, 49),
      LinearSales(3, 225),
      LinearSales(4, 240),
      LinearSales(5, 270),
      LinearSales(6, 225),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}












// import 'package:flutter/material.dart';

// import 'package:fl_chart/fl_chart.dart';

// class LineChartUi extends StatefulWidget {
//   const LineChartUi({super.key});

//   @override
//   State<LineChartUi> createState() => _LineChartUiState();
// }

// class _LineChartUiState extends State<LineChartUi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LineChart(
//         LineChartData(
//           lineTouchData: LineTouchData(enabled: true),
//           lineBarsData: [
//             LineChartBarData(
//               spots: [
//                 const FlSpot(0, 1),
//                 const FlSpot(1, 1),
//                 const FlSpot(2, 3),
//                 const FlSpot(3, 4),
//                 const FlSpot(3, 5),
//                 const FlSpot(4, 4)
//               ],
//               isCurved: true,
//               barWidth: 2,
//               color: Colors.orange,
//               belowBarData: BarAreaData(
//                 show: true,
//                 color: Colors.lightBlue.withOpacity(0.5),
//                 cutOffY: cutOffYValue,
//                 applyCutOffY: true,
//               ),
//               aboveBarData: BarAreaData(
//                 show: true,
//                 color: Colors.lightGreen.withOpacity(0.5),
//                 cutOffY: cutOffYValue,
//                 applyCutOffY: true,
//               ),
//               dotData: FlDotData(
//                 show: false,
//               ),
//             ),
//           ],
//           minY: 0,
//           titlesData: FlTitlesData(
//             bottomTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 5,
//                 // textStyle: yearTextStyle,
//                 showTitles: (value) {
//                   switch (value.toInt()) {
//                     case 0:
//                       return '2016';
//                     case 1:
//                       return '2017';

//                     default:
//                       return '';
//                   }
//                 }),
//             leftTitles: SideTitles(
//               showTitles: true,
//               getTitles: (value) {
//                 return '\$ ${value + 100}';
//               },
//             ),
//           ),
//           axisTitleData: FlAxisTitleData(
//               leftTitle:
//                   AxisTitle(showTitle: true, titleText: 'Value', margin: 10),
//               bottomTitle: AxisTitle(
//                   showTitle: true,
//                   margin: 10,
//                   titleText: 'Year',
//                   textStyle: yearTextStyle,
//                   textAlign: TextAlign.right)),
//           gridData: FlGridData(
//             show: true,
//             checkToShowHorizontalLine: (double value) {
//               return value == 1 || value == 2 || value == 3 || value == 4;
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
