import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/models/staff.dart';

import 'package:school_management_app/widgets/header.dart';

class ManageStaff extends StatelessWidget {
  static const routename = '/manageStaff';
  const ManageStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    // final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Staffs',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        child: GetBuilder<UserController>(
                          init: UserController(),
                          // initState: (controller) {
                          //   controller.
                          // },
                          builder: (controller) {
                            return DataTable(
                                showCheckboxColumn: true,
                                columns: const [
                                  DataColumn(label: Text('SN'), numeric: true),
                                  DataColumn(
                                    label: Text('Names'),
                                  ),
                                  DataColumn(
                                    label: Text('Email'),
                                  ),
                                  DataColumn(
                                    label: Text('Username'),
                                  ),
                                  DataColumn(
                                    label: Text('Address'),
                                  ),
                                  DataColumn(
                                    label: Text('Picture'),
                                  ),
                                  DataColumn(
                                    label: Text('Mobile'),
                                  ),
                                  DataColumn(
                                    label: Text('DOB'),
                                  ),
                                  DataColumn(
                                    label: Text('Action'),
                                  )
                                ],
                                rows: List.generate(
                                    controller.staffLists.length, (index) {
                                  Staffs staff = controller.staffLists[index];
                                  // if (controller.isLoading.isTrue) {
                                  //   return;
                                  // }
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Text((index + 1).toString()),
                                      ),
                                      DataCell(
                                        Text(
                                            '${staff.customuser.firstName} ${staff.customuser.lastName}'),
                                      ),
                                      DataCell(
                                        Text(staff.customuser.email),
                                      ),
                                      DataCell(Text(staff.customuser.username)),
                                      DataCell(
                                        Text(staff.address),
                                      ),
                                      DataCell(CircleAvatar(
                                        backgroundImage:
                                            Image.network(staff.profilePic)
                                                .image,
                                      )),
                                      DataCell(
                                        Text(staff.phoneNo),
                                      ),
                                      DataCell(
                                        Text(staff.dob),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            controller.staffDelete(
                                                staff.customuser.id.toString(),
                                                context);
                                          },
                                          icon: const Icon(
                                              FontAwesomeIcons.trash,
                                              color: Colors.red,
                                              size: 15),
                                        ),
                                      ),
                                    ],
                                  );
                                }));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
