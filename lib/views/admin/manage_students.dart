import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';

import 'package:school_management_app/widgets/header.dart';

class ManageStudent extends StatelessWidget {
  static const routename = '/manageStudent';
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
                        child: DataTable(
                            // headingRowColor: Colors.green,
                            // columnSpacing: 100,
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
                            rows: [
                              DataRow(cells: [
                                const DataCell(Text('1')),
                                const DataCell(Text('Mba Gospel')),
                                const DataCell(Text('gosper4u@gmail.com')),
                                const DataCell(Text('mba_gozpel')),
                                const DataCell(Text('Lekki Gardens')),
                                const DataCell(CircleAvatar(
                                  backgroundColor: kSecondaryColor,
                                )),
                                const DataCell(Text('08134294242')),
                                const DataCell(Text('25-09-2021')),
                                DataCell(Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(FontAwesomeIcons.edit,
                                          color: Colors.green, size: 15),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(FontAwesomeIcons.trash,
                                          color: Colors.red, size: 15),
                                    ),
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
