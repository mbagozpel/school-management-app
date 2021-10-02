import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class PermissionRequest extends StatelessWidget {
  static const routeName = '/takepermission';
  const PermissionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime _selectedDate = DateTime.now();
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
                      Text('Permision Request',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: _size.height * 0.04),
                      TextField(
                        onTap: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(1940),
                              lastDate: DateTime(2030));
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Starting From',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                      ),
                      SizedBox(height: _size.height * 0.04),
                      TextField(
                        onTap: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(1940),
                              lastDate: DateTime(2030));
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'To',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                      ),
                      SizedBox(height: _size.height * 0.04),
                      const TextField(
                        maxLines: 5,
                        autocorrect: true,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          labelText: 'Reason for request',
                        ),
                      ),
                      SizedBox(height: _size.height * 0.06),
                      DefaultButton(text: 'Take Permission', press: () {})
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
                      'Permision History',
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
                          rows: [
                            DataRow(cells: [
                              const DataCell(Text('1')),
                              const DataCell(Text('12-03-2021')),
                              const DataCell(Text('12-04-2021')),
                              const DataCell(Text('I am going for my wedding')),
                              DataCell(DefaultButton(
                                  press: () {},
                                  text: 'Pending',
                                  width: _size.width * 0.05)),
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
