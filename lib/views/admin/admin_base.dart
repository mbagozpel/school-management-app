import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/controllers/custom_page.dart';
import 'package:school_management_app/models/side_bar.dart';
import 'package:school_management_app/utils/basic_utils.dart';
import 'package:school_management_app/utils/responsive.dart';

import 'package:school_management_app/widgets/sidebar.dart';

class AdminBase extends StatelessWidget {
  // final Widget? widget;
  const AdminBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: menuController.scaffoldKey,
        drawer: SideBar(sideBarList: adminSideBar),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // side menu only for desktop
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  child: SideBar(
                sideBarList: adminSideBar,
              )),
            GetBuilder<CustomPageController>(
              init: CustomPageController(),
              // initState: (_) {},
              builder: (controller) {
                return Expanded(
                    flex: 5,
                    child: adminSideBar[controller.selectedIndex].widget!);
              },
            )
          ],
        ));
  }
}
