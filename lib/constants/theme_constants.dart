import 'package:flutter/material.dart';

InputDecorationTheme inputDecor() {
  // ignore: prefer_const_constructors
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    isCollapsed: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
