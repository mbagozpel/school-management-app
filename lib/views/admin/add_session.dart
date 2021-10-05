import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/views/admin/manage_session.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class AddSession extends StatelessWidget {
  static const routeName = '/addClass';
  const AddSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    // final OtherControllers _controller = OtherControllers();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
              child: ListView(
            controller: _scrollController,
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
                    child: GetBuilder<OtherControllers>(
                      init: OtherControllers(),
                      initState: (_) {},
                      builder: (_controller) {
                        return Form(
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
                        );
                      },
                    )),
              ),
              const ManageSession()
            ],
          ))
        ],
      ),
    );
  }
}
