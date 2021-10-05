import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/attendance_controller.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/student_controller.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/student.dart';

import 'package:school_management_app/models/term.dart';
import 'package:school_management_app/services/api.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class TakeAttendance extends StatelessWidget {
  static const routeName = '/takeAttendance';
  const TakeAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int classId = 0;
    int sessionId = 0;
    final size = MediaQuery.of(context).size;
    final AttendanceController _controller = AttendanceController();
    List<Map<String, dynamic>> studentIds = [];
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
                      Text('Take Attendance',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: size.height * 0.04),
                      GetBuilder<OtherControllers>(
                        init: OtherControllers(),
                        initState: (_) {},
                        builder: (controller) {
                          return DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a class';
                              }
                              return null;
                            },
                            key: const ValueKey('class'),
                            isDense: true,
                            onChanged: (Classes? value) {
                              controller.classObj = value!;
                            },
                            onSaved: (Classes? value) {
                              _controller.attendance.classId.id = value!.id;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Class',
                              isCollapsed: true,
                            ),
                            items: List.generate(controller.classLists.length,
                                (index) {
                              Classes classObj = controller.classLists[index];
                              return DropdownMenuItem<Classes>(
                                onTap: () {
                                  _controller.attendance.classId.id =
                                      classObj.id;
                                  classId = classObj.id;
                                },
                                value: classObj,
                                child: Text(classObj.className),
                              );
                            }),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.04),
                      GetBuilder<OtherControllers>(
                        init: OtherControllers(),
                        initState: (_) {},
                        builder: (controller) {
                          return Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a session';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey('session'),
                                  isDense: true,
                                  onChanged: (SessionYearModel? value) {
                                    controller.session = value!;
                                  },
                                  onSaved: (SessionYearModel? value) {
                                    _controller.attendance.sessionYearId.id =
                                        value!.id;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Session',
                                    isCollapsed: true,
                                  ),
                                  items: List.generate(
                                      controller.sessionLists.length, (index) {
                                    SessionYearModel session =
                                        controller.sessionLists[index];
                                    return DropdownMenuItem<SessionYearModel>(
                                      onTap: () {
                                        _controller.attendance.sessionYearId
                                            .id = session.id;
                                        sessionId = session.id;
                                      },
                                      value: session,
                                      child: Text(session.sessionStartYear +
                                          '/' +
                                          session.sessionEndYear),
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a term';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey('term'),
                                  isDense: true,
                                  onChanged: (Term? value) {
                                    controller.term = value!;
                                  },
                                  onSaved: (Term? value) {
                                    _controller.attendance.term.id = value!.id;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Term',
                                    isCollapsed: true,
                                  ),
                                  items: List.generate(
                                      controller.termLists.length, (index) {
                                    Term term = controller.termLists[index];
                                    return DropdownMenuItem<Term>(
                                      onTap: () {
                                        _controller.attendance.term.id =
                                            term.id;
                                      },
                                      value: term,
                                      child: Text(term.title +
                                          ' ' +
                                          term.session.sessionStartYear +
                                          '/' +
                                          term.session.sessionEndYear),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.06),
                      GetBuilder<StudentController>(
                        init: StudentController(),
                        initState: (_) {},
                        builder: (controller) {
                          return Column(
                            children: [
                              DefaultButton(
                                  text: 'Fetch Students',
                                  press: () {
                                    controller.fetchClassStudents(context,
                                        classId: classId, session: sessionId);
                                  }),
                              SizedBox(height: size.height * 0.06),
                              Wrap(
                                children: List.generate(
                                  controller.studentList.length,
                                  (index) {
                                    var idStatus = <String, dynamic>{};
                                    if (controller.classStudents.isEmpty) {
                                      return const Text(
                                          'No Student has been added yet');
                                    } else {
                                      Students student =
                                          controller.studentList[index];
                                      idStatus['id'] = student.customuser.id;
                                      idStatus['status'] = false;
                                      // if (idStatus['id'] in studentIds) {
                                      //   studentIds.add(idStatus);
                                      // }

                                      return Row(
                                        children: [
                                          Text(student.customuser.lastName +
                                              ' ' +
                                              student.customuser.firstName),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Checkbox(
                                              value: controller.status,
                                              onChanged: (value) {
                                                controller
                                                    .takeAttendance(value);
                                                idStatus['status'] = value;

                                                print(studentIds);
                                              })
                                        ],
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.06),
                      TextFormField(
                        controller: _controller.dateValue,
                        onTap: () {
                          _controller.selectDate(context);
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Attendance Date',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.calendar),
                            )),
                        onSaved: (value) {
                          _controller.attendance.attendanceDate = value!;
                        },
                      ),
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
