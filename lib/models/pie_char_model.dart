class PieChartModel {
  final int value;
  final String name;

  const PieChartModel({required this.value, required this.name});
}

List<PieChartModel> demoPie = const [
  PieChartModel(value: 20, name: 'JSS2'),
  PieChartModel(value: 30, name: 'SS1'),
  PieChartModel(value: 40, name: 'SS2'),
  PieChartModel(value: 15, name: 'SS3'),
  PieChartModel(value: 23, name: 'JSS1')
];
