import 'package:flutter/material.dart';
import 'package:school_management_app/models/stats_card_model.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/stats_card.dart';

class HumanStats extends StatelessWidget {
  const HumanStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Responsive(
      desktop: StatsGridView(
        childAspectRatio: _size.width < 1400 ? 1.8 : 2,
      ),
      tablet: StatsGridView(
        childAspectRatio: _size.width < 850 ? 1.4 : 1.5,
      ),
      mobile: StatsGridView(
        childAspectRatio: _size.width < 700 ? 2.1 : 1.3,
        crossAxisCount: _size.width < 700 ? 2 : 4,
      ),
    );
  }
}

class StatsGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const StatsGridView(
      {Key? key, this.crossAxisCount = 4, this.childAspectRatio = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: adminStats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => StatsCard(
        stats: adminStats[index],
      ),
    );
  }
}
