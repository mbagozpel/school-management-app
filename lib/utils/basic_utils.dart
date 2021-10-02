library config.globals;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_management_app/controllers/menu_controller.dart';

MenuController menuController = MenuController();
HttpClient client = HttpClient();
Dio dio = Dio();

void showSnackBar(BuildContext context, {required String text}) {
  final SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.blue,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showMaterialBanner(BuildContext context, {required String text}) {
  final materialBanner = MaterialBanner(content: Text(text), actions: actions);
  ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
}

List<Widget> actions = [Container(), Container()];
