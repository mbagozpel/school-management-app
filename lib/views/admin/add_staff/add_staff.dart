import 'package:flutter/material.dart';

import 'package:school_management_app/views/admin/add_staff/staff_form.dart';

import 'package:school_management_app/widgets/header.dart';

class AddStaff extends StatelessWidget {
  static const routename = '/addstaff';
  const AddStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              controller: _scrollController,
              // shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                  child: StaffForm(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
