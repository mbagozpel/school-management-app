import 'package:flutter/material.dart';
import 'package:school_management_app/constants/colors.dart';

class ChartGridCard extends StatelessWidget {
  final String title;
  final Widget widget;
  const ChartGridCard({Key? key, required this.title, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          boxShadow: const [kShadow]),
      child: Column(
        children: [Text(title), const Divider(), Expanded(child: widget)],
      ),
    );
  }
}
