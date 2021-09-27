import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/custom_page.dart';

import 'package:school_management_app/models/side_bar.dart';

class DrawerListTile extends StatelessWidget {
  final SideBarModel model;
  final int index;
  const DrawerListTile({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomPageController>(
      init: CustomPageController(),
      // initState: (_) {},
      builder: (controller) {
        return ListTile(
          minVerticalPadding: 0.0,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          onTap: () => controller.selected(index),
          horizontalTitleGap: 0.0,
          leading: Icon(
            model.icon,
            color: kPrimaryColor,
            size: 20,
          ),
          title: Text(
            model.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kBackgroundColor, fontSize: 12),
          ),
          // trailing: const Icon(Icons.arrow_forward_ios, size: 10),
          selected: index == controller.selectedIndex,
          selectedTileColor: Colors.blue,
          hoverColor: kPrimaryColor,
        );
      },
    );
  }
}
