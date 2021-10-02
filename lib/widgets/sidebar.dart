import 'package:flutter/material.dart';

import 'package:school_management_app/constants/app_strings.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/models/side_bar.dart';
import 'package:school_management_app/widgets/drawer_list_tile.dart';

class SideBar extends StatelessWidget {
  final List<SideBarModel> sideBarList;
  const SideBar({Key? key, required this.sideBarList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: kSecondaryColor,
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.15,
              child: const DrawerHeader(
                child: Center(child: Text(School.schoolName)),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => DrawerListTile(
                        model: sideBarList[index],
                        index: index,
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        height: 2,
                        thickness: 1,
                        color: Color(0xFFBDBDBD),
                      ),
                  itemCount: sideBarList.length),
            )
          ],
        ),
      ),
    );
  }
}
