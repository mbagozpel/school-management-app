library config.globals;

import 'package:flutter/material.dart';
import 'package:school_management_app/controllers/menu_controller.dart';

MenuController menuController = MenuController();

void showSnackBar(BuildContext context, {required String text}) {
  final SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showMaterialBanner(BuildContext context, {required String text}) {
  final materialBanner = MaterialBanner(content: Text(text), actions: actions);
  ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
}

List<Widget> actions = [Container(), Container()];
