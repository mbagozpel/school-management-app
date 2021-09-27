import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? mobileSmall;
  final Widget desktop;

  const Responsive(
      {Key? key,
      required this.mobile,
      required this.desktop,
      this.mobileSmall,
      required this.tablet})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isMobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 400;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 700;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return desktop;
      } else if (constraints.maxWidth >= 700) {
        return tablet;
      } else if (constraints.maxWidth <= 700) {
        return mobile;
      } else {
        return mobileSmall!;
      }
    });
  }
}
