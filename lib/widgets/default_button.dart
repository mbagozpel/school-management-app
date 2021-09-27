import 'package:flutter/material.dart';
import 'package:school_management_app/constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double? width;
  final Color? color;
  final Color? textColor;
  const DefaultButton(
      {Key? key,
      this.color = kPrimaryColor,
      this.textColor = Colors.black,
      required this.text,
      required this.press,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      onPressed: press,
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: textColor),
      ),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
