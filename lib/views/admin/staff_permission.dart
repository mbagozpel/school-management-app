import 'package:flutter/material.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';

import 'package:school_management_app/widgets/header.dart';

class StaffPermissions extends StatelessWidget {
  static const routename = '/staffpermission';
  const StaffPermissions({Key? key}) : super(key: key);

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
                        'Staff Permissions',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        child: DataTable(
                            // headingRowColor: Colors.green,
                            // columnSpacing: 100,
                            showCheckboxColumn: true,
                            columns: const [
                              DataColumn(label: Text('SN'), numeric: true),
                              DataColumn(
                                label: Text('Name'),
                              ),
                              DataColumn(label: Text('Reason for Request')),
                              DataColumn(
                                label: Text('From'),
                              ),
                              DataColumn(
                                label: Text('To'),
                              ),
                              DataColumn(
                                label: Text('Mobile'),
                              ),
                              DataColumn(
                                label: Text('Action'),
                              )
                            ],
                            rows: [
                              DataRow(cells: [
                                const DataCell(Text('1')),
                                const DataCell(Text('Mba Gospel')),
                                const DataCell(Text('My Wedding')),
                                const DataCell(Text('25-09-2021')),
                                const DataCell(Text('25-09-2021')),
                                const DataCell(Text('08134294242')),
                                DataCell(Row(
                                  children: [
                                    DefaultButton(
                                        text: 'Approve',
                                        color: Colors.green,
                                        textColor: kWhiteColor,
                                        press: () {},
                                        width: _size.width * 0.05),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    DefaultButton(
                                        text: 'Disapprove',
                                        color: Colors.red,
                                        textColor: kWhiteColor,
                                        press: () {},
                                        width: _size.width * 0.05),
                                  ],
                                )),
                              ])
                            ]),
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
