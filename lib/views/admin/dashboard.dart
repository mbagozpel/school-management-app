import 'package:flutter/material.dart';
import 'package:school_management_app/views/admin/chart_widget.dart';
import 'package:school_management_app/views/admin/human_statistics.dart';
import 'package:school_management_app/widgets/header.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: HumanStats(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ChartWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
