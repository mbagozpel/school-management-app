import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class ManageAttendance extends StatelessWidget {
  static const routeName = '/updateAttendance';
  const ManageAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime _selectedDate = DateTime.now();
    final size = MediaQuery.of(context).size;
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
                      Text('Manage Attendance',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: size.height * 0.04),
                      const TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                            isCollapsed: true,
                            labelText: 'Class',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(Icons.arrow_drop_down),
                            )),
                      ),
                      SizedBox(height: size.height * 0.04),
                      const TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                            isCollapsed: true,
                            labelText: 'Session',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(Icons.arrow_drop_down),
                            )),
                      ),
                      SizedBox(height: size.height * 0.04),
                      DefaultButton(text: 'Fetch Students', press: () {}),
                      SizedBox(height: size.height * 0.06),
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
                            labelText: 'Attendance Date',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                      ),
                      SizedBox(height: size.height * 0.06),
                      DefaultButton(
                          text: 'Fetch Attendance Data', press: () {}),
                      SizedBox(height: size.height * 0.06),
                      DefaultButton(text: 'Save Attendance', press: () {})
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
