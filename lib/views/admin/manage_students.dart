import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/student_controller.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/student.dart';

import 'package:school_management_app/widgets/header.dart';

class ManageStudent extends StatelessWidget {
  static const routename = '/manageStaff';
  const ManageStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
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
                        'All Students',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        child: GetBuilder<StudentController>(
                          init: StudentController(),
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
                                    label: Text('Class'),
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
                                    controller.studentList.length, (index) {
                                  Students student =
                                      controller.studentList[index];
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
                                            '${student.customuser.firstName} ${student.customuser.lastName}'),
                                      ),
                                      DataCell(
                                        Text(student.customuser.email),
                                      ),
                                      DataCell(
                                          Text(student.customuser.username)),
                                      DataCell(
                                        Text(student.address),
                                      ),
                                      DataCell(CircleAvatar(
                                        backgroundImage:
                                            Image.network(student.profilePic)
                                                .image,
                                      )),
                                      DataCell(
                                        Text(student.phoneNo),
                                      ),
                                      DataCell(
                                        Text(student.dob),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            // controller.staffDelete(
                                            //     staff.customuser.id.toString(),
                                            //     context);
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
