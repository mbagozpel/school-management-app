import 'package:flutter/material.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/models/pie_char_model.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/chart_grid_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Responsive(
        mobile: AdminChartGrid(
          crossAxiscount: _size.width < 450 ? 1 : 2,
          // childAspectRatio: _size.width < 450 ? 1.5 : 1,
        ),
        desktop: const AdminChartGrid(
            // childAspectRatio: _size.width < 1400 ? 1.4 : 1.5,
            // childAspectRatio: _size.width < 850 ? 1.3 : 1.5,
            ),
        tablet: const AdminChartGrid(
            // childAspectRatio: _size.width < 850 ? 1.3 : 1.5,
            // childAspectRatio: _size.width < 850 ? 1.3 : 1.5,
            ));
  }
}

class AdminChartGrid extends StatelessWidget {
  final int crossAxiscount;
  final double childAspectRatio;
  const AdminChartGrid(
      {Key? key, this.childAspectRatio = 1.3, this.crossAxiscount = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxiscount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: const [
        ChartGridCard(title: 'Number of Students', widget: CustomPie()),
        ChartGridCard(title: 'Number of Subjects', widget: CustomBubble()),
      ],
    );
  }
}

class CustomPie extends StatelessWidget {
  const CustomPie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<PieChartModel, dynamic>(
            dataSource: demoPie,
            xValueMapper: (PieChartModel data, _) => data.name,
            yValueMapper: (PieChartModel data, _) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: true))
      ],
    );
  }
}

class CustomBubble extends StatelessWidget {
  const CustomBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        BubbleSeries<ChartData, int>(
            dataSource: chartData,
            sizeValueMapper: (ChartData data, _) => data.size,
            pointColorMapper: (ChartData data, _) => data.pointColor,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
    );
  }
}

class ChartData {
  final int x;
  final double y;
  final double size;
  final Color pointColor;

  const ChartData(this.x, this.y, this.size, this.pointColor);
}

final List<ChartData> chartData = [
  const ChartData(2010, 35, 0.32, Colors.green),
  const ChartData(2011, 38, 0.21, Colors.red),
  const ChartData(2012, 34, 0.38, Colors.amber),
  const ChartData(2013, 52, 0.29, Colors.purple),
  const ChartData(2014, 40, 0.34, Colors.blue)
];
