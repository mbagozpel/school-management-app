import 'package:flutter/material.dart';
import 'package:school_management_app/models/stats_card_model.dart';

class StatsCard extends StatelessWidget {
  final StatsModel stats;

  const StatsCard({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(stats.icon),
                Text(
                  stats.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                )
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Text(
              stats.figure.toString(),
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: stats.gradient,
          boxShadow: const [
            BoxShadow(offset: Offset(5, 10), blurRadius: 10, color: Colors.grey)
          ]),
    );
  }
}
