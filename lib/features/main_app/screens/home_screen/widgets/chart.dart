import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../common/widgets/loaders/shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/linechart_controller.dart';

class LineChart extends StatefulWidget {
  const LineChart({Key? key}) : super(key: key);

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
 final LineChartController controller = LineChartController();

  @override
  void initState() {
    super.initState();
    controller.generateWeeklyData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: StreamBuilder<List<ChartData>>(
        stream: controller.dataStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm * 1.5),
              child: TShimmerEffect(width: double.infinity, height: 320),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SfCartesianChart(
              borderColor: Colors.transparent,
              primaryXAxis: const CategoryAxis(
                labelStyle: TextStyle(fontSize: 10),
                majorGridLines: MajorGridLines(width: 0.5),
                axisLine: AxisLine(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                labelStyle: TextStyle(fontSize: 10),
                majorGridLines: MajorGridLines(width: 0.5),
                axisLine: AxisLine(width: 0),
              ),

              series: <SplineSeries<ChartData, String>>[
                SplineSeries<ChartData, String>(
                  color: Colors.deepPurple.shade400,
                  isVisibleInLegend: true,
                  dataSource: snapshot.data ?? [],
                  xValueMapper: (ChartData data, _) => data.week,
                  yValueMapper: (ChartData data, _) => data.debitAmount,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}