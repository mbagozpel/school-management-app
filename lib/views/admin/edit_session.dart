import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/models/session.dart';

import 'package:school_management_app/widgets/default_button.dart';

class EditSession extends StatelessWidget {
  final SessionYearModel session;
  const EditSession({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OtherControllers _controller = OtherControllers();
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: kBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      actions: [
        Form(
          key: _controller.sessionFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Session Information',
                  style: Theme.of(context).textTheme.headline6),
              const Divider(),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                controller: _controller.dateValue,
                onTap: () {
                  _controller.selectDate(context);
                },
                autocorrect: true,
                decoration: const InputDecoration(
                    isCollapsed: true,
                    labelText: 'Session Start Year',
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.calendar),
                    )),
                onSaved: (value) {
                  _controller.session.sessionStartYear = value!;
                },
              ),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                controller: _controller.dateValue2,
                onTap: () {
                  _controller.selectDate2(context);
                },
                autocorrect: true,
                decoration: const InputDecoration(
                    isCollapsed: true,
                    labelText: 'Session End Year',
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.calendar),
                    )),
                onSaved: (value) {
                  _controller.session.sessionEndYear = value!;
                },
              ),
              SizedBox(height: size.height * 0.06),
              DefaultButton(
                  text: 'Add Session',
                  press: () {
                    _controller.addSession(context);
                  })
            ],
          ),
        )
      ],
    );
  }
}
