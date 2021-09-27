import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class AddSession extends StatelessWidget {
  static const routeName = '/addClass';
  AddSession({Key? key}) : super(key: key);
  final DateTime _selectedDate1 = DateTime.now();
  final DateTime _selectedDate2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                      Text('Session Information',
                          style: Theme.of(context).textTheme.headline6),
                      const Divider(),
                      SizedBox(height: size.height * 0.04),
                      TextField(
                        onTap: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: _selectedDate1,
                              firstDate: DateTime(1940),
                              lastDate: DateTime(2030));
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Session Start Year',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                      ),
                      SizedBox(height: size.height * 0.04),
                      TextField(
                        onTap: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: _selectedDate2,
                              firstDate: DateTime(1940),
                              lastDate: DateTime(2030));
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Session End Year',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                      ),
                      SizedBox(height: size.height * 0.06),
                      DefaultButton(text: 'Add Session', press: () {})
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
