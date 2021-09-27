import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';

import 'package:school_management_app/widgets/header.dart';

class ManageSubject extends StatelessWidget {
  static const routename = '/manageSubject';
  const ManageSubject({Key? key}) : super(key: key);

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
                        'All Subjects',
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
                                label: Text('Subject Title'),
                              ),
                              DataColumn(
                                label: Text('Subject Teacher'),
                              ),
                              DataColumn(
                                label: Text('Action'),
                              )
                            ],
                            rows: [
                              DataRow(cells: [
                                const DataCell(Text('1')),
                                const DataCell(Text('ICT')),
                                const DataCell(Text('Mr. Izu')),
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
