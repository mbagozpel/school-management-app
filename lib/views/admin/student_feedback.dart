import 'package:flutter/material.dart';
import 'package:school_management_app/constants/colors.dart';

import 'package:school_management_app/widgets/header.dart';

class StudentFeedback extends StatelessWidget {
  static const routename = '/studentfeedback';
  const StudentFeedback({Key? key}) : super(key: key);

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
                        'Students\' Comments',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SingleChildScrollView(
                        child: DataTable(
                            columnSpacing: 100,
                            showCheckboxColumn: true,
                            columns: const [
                              DataColumn(
                                label: Text('SN'),
                              ),
                              DataColumn(
                                label: Text('Name'),
                              ),
                              DataColumn(label: Text('Message')),
                              DataColumn(
                                label: Text('Date'),
                              ),
                              DataColumn(
                                label: Text('Mobile'),
                              ),
                              DataColumn(
                                label: Text('Reply'),
                              )
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('Mba Gospel')),
                                DataCell(Text('I don\'t like the school')),
                                DataCell(Text('25-09-2021')),
                                DataCell(Text('08134294242')),
                                DataCell(Text('Your business')),
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
