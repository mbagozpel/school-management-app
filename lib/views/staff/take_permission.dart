import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/permission_feedback_controller.dart';
import 'package:school_management_app/models/permission_staff.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class PermissionRequest extends StatelessWidget {
  static const routeName = '/takepermission';
  const PermissionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kWhiteColor),
                    child: GetBuilder<FeedbackPermissionController>(
                      init: FeedbackPermissionController(),
                      initState: (_) {},
                      builder: (controller) {
                        return Form(
                          key: controller.permissionKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Permision Request',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              const Divider(),
                              SizedBox(height: _size.height * 0.04),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select a date';
                                  }
                                  return null;
                                },
                                controller: controller.dateValue,
                                onTap: () {
                                  controller.selectDate(context);
                                },
                                autocorrect: true,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    labelText: 'Starting from',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FaIcon(FontAwesomeIcons.calendar),
                                    )),
                                onSaved: (value) {
                                  controller.permissionReportStaff
                                      .permissionStartDate = value!;
                                },
                              ),
                              SizedBox(height: _size.height * 0.04),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select a date';
                                  }
                                  return null;
                                },
                                controller: controller.dateValue2,
                                onTap: () {
                                  controller.selectDate2(context);
                                },
                                autocorrect: true,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    labelText: 'To',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FaIcon(FontAwesomeIcons.calendar),
                                    )),
                                onSaved: (value) {
                                  controller.permissionReportStaff
                                      .permissionEndDate = value!;
                                },
                              ),
                              SizedBox(height: _size.height * 0.04),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a text';
                                  }
                                },
                                maxLines: 5,
                                autocorrect: true,
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  labelText: 'Reason for request',
                                ),
                                onSaved: (value) {
                                  controller.permissionReportStaff
                                      .permissionMessage = value!;
                                },
                              ),
                              SizedBox(height: _size.height * 0.06),
                              DefaultButton(
                                  text: 'Take Permission',
                                  press: () {
                                    controller.staffAskPermission(context);
                                  })
                            ],
                          ),
                        );
                      },
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kWhiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Permision History',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    SingleChildScrollView(
                      child: GetBuilder<FeedbackPermissionController>(
                        init: FeedbackPermissionController(),
                        initState: (_) {},
                        builder: (controller) {
                          return DataTable(
                            // headingRowColor: Colors.green,
                            // columnSpacing: 100,
                            showCheckboxColumn: true,
                            columns: const [
                              DataColumn(label: Text('SN'), numeric: true),
                              DataColumn(
                                label: Text('Start Date'),
                              ),
                              DataColumn(
                                label: Text('End Date'),
                              ),
                              DataColumn(
                                label: Text('Reason for Request'),
                              ),
                              DataColumn(
                                label: Text('Permission Status'),
                              )
                            ],
                            rows: List.generate(
                                controller.staffPermission.length, (index) {
                              PermissionReportStaff permission =
                                  controller.staffPermission[index];
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      (index + 1).toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(permission.permissionStartDate),
                                  ),
                                  DataCell(
                                    Text(permission.permissionEndDate),
                                  ),
                                  DataCell(
                                    Text(permission.permissionMessage),
                                  ),
                                  DataCell(
                                    DefaultButton(
                                      text: permission.permissionStatus == 0
                                          ? 'Pending'
                                          : permission.permissionStatus == 1
                                              ? 'Approved'
                                              : 'Disapproved',
                                      press: () {},
                                      color: permission.permissionStatus == 0
                                          ? kPrimaryColor
                                          : permission.permissionStatus == 1
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
