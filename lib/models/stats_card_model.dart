import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';

class StatsModel {
  final String title;
  final int figure;
  final IconData icon;
  final Gradient gradient;

  const StatsModel(
      {required this.title,
      required this.figure,
      required this.icon,
      required this.gradient});
}

List<StatsModel> adminStats = [
  const StatsModel(
      title: 'Teachers',
      figure: 1000,
      icon: FontAwesomeIcons.users,
      gradient: kGreenGradient),
  const StatsModel(
      title: 'Students',
      figure: 10000,
      icon: FontAwesomeIcons.usersCog,
      gradient: kBlueGradient),
  const StatsModel(
      title: 'Classes',
      figure: 100,
      icon: FontAwesomeIcons.home,
      gradient: kYellowGradient),
  const StatsModel(
      title: 'Subjects',
      figure: 1000,
      icon: FontAwesomeIcons.book,
      gradient: kRedGradient)
];
