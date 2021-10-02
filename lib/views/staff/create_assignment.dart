import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/assignment_controller.dart';
import 'package:school_management_app/views/staff/question_form.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class Assignment extends StatelessWidget {
  static const routeName = '/assignment';
  const Assignment({Key? key}) : super(key: key);

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
                      Text('Create Assignment',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: size.height * 0.04),
                      Row(
                        children: const [
                          Expanded(
                            child: TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  labelText: 'Class',
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(Icons.arrow_drop_down),
                                  )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  labelText: 'Session',
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(Icons.arrow_drop_down),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      Row(
                        children: const [
                          Expanded(
                            child: TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  labelText: 'Term',
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(Icons.arrow_drop_down),
                                  )),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      GetBuilder<AssignmentController>(
                        init: AssignmentController(),
                        // initState: (_) {},
                        builder: (controller) {
                          return Column(
                            children: [
                              DefaultButton(
                                  text: 'Continue',
                                  width: size.width * 0.1,
                                  press: () {
                                    controller.isContinue();
                                  }),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<AssignmentController>(
                  init: AssignmentController(),
                  builder: (controller) {
                    if (controller.startCreation == true) {
                      return const QuestionForm();
                    }
                    return Container();
                  })
            ],
          ))
        ],
      ),
    );
  }
}
