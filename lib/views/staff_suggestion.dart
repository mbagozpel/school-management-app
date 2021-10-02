import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class StaffSuggestions extends StatelessWidget {
  static const routeName = '/staffcomments';
  const StaffSuggestions({Key? key}) : super(key: key);

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Staff Suggestions',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: _size.height * 0.04),
                      const TextField(
                        maxLines: 5,
                        autocorrect: true,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          labelText: 'Suggestions',
                        ),
                      ),
                      SizedBox(height: _size.height * 0.06),
                      DefaultButton(text: 'Submit Suggestion', press: () {})
                    ],
                  ),
                ),
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
                      'Suggestions History',
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
                              label: Text('Suggestions'),
                            ),
                            DataColumn(
                              label: Text('Suggestions Reply'),
                            )
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('Build more classes')),
                              DataCell(Text('We\'ll see to that')),
                            ])
                          ]),
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
