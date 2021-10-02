import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/views/admin/edit_class.dart';

import 'package:school_management_app/widgets/header.dart';

class ManageClass extends StatelessWidget {
  static const routename = '/manageClass';
  const ManageClass({Key? key}) : super(key: key);

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
                        'All Classes',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        child: GetBuilder<OtherControllers>(
                          init: OtherControllers(),
                          builder: (controller) {
                            return DataTable(
                              // headingRowColor: Colors.green,
                              // columnSpacing: 100,
                              showCheckboxColumn: true,
                              columns: const [
                                DataColumn(label: Text('SN'), numeric: true),
                                DataColumn(
                                  label: Text('Class Title'),
                                ),
                                DataColumn(
                                  label: Text('Class Teacher'),
                                ),
                                DataColumn(
                                  label: Text('Edit'),
                                ),
                                DataColumn(
                                  label: Text('Delete'),
                                )
                              ],
                              rows: List.generate(controller.classLists.length,
                                  (index) {
                                Classes classObj = controller.classLists[index];
                                return DataRow(cells: [
                                  DataCell(
                                    Text(
                                      (index + 1).toString(),
                                    ),
                                  ),
                                  DataCell(Text(classObj.className)),
                                  DataCell(Text(
                                      classObj.staff.customuser.lastName +
                                          ' ' +
                                          classObj.staff.customuser.firstName)),
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(FontAwesomeIcons.edit,
                                          color: Colors.blue, size: 15),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                EditClass(
                                                  classObj: classObj,
                                                ));
                                      },
                                    ),
                                  ),
                                  DataCell(IconButton(
                                    icon: const Icon(FontAwesomeIcons.trash,
                                        color: Colors.red, size: 15),
                                    onPressed: () {
                                      controller.classDelete(
                                          classObj.id, context);
                                    },
                                  ))
                                ]);
                              }),
                            );
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
