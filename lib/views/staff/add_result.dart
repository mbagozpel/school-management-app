import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/result_controller.dart';
import 'package:school_management_app/controllers/student_controller.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/models/term.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class AddResult extends StatelessWidget {
  static const routeName = '/addResult';
  const AddResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultController _controller = ResultController();
    final size = MediaQuery.of(context).size;
    int classId = 0;
    int sessionId = 0;
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
                  child: Form(
                    key: _controller.resultKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Manage Student Result',
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
                                if (value.isBlank!) {
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
                                _controller.result.classId.id = value!.id;
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
                                    _controller.result.classId.id = classObj.id;
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
                                      if (value.isBlank!) {
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
                                      _controller.result.session.id = value!.id;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Session',
                                      isCollapsed: true,
                                    ),
                                    items: List.generate(
                                        controller.sessionLists.length,
                                        (index) {
                                      SessionYearModel session =
                                          controller.sessionLists[index];
                                      return DropdownMenuItem<SessionYearModel>(
                                        onTap: () {
                                          _controller.result.session.id =
                                              session.id;
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
                                      if (value.isBlank!) {
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
                                      _controller.result.term.id = value!.id;
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
                                          _controller.result.term.id = term.id;
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
                                DropdownButtonFormField(
                                  validator: (value) {
                                    if (value.isBlank!) {
                                      return 'Please select a student';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey('student'),
                                  isDense: true,
                                  onChanged: (Students? value) {
                                    controller.students = value!;
                                  },
                                  onSaved: (Students? value) {
                                    _controller.result.student.customuser.id =
                                        value!.customuser.id;
                                  },
                                  decoration: const InputDecoration(
                                      isCollapsed: true, labelText: 'Student'),
                                  items: List.generate(
                                      controller.classStudents.length, (index) {
                                    Students student =
                                        controller.classStudents[index];
                                    return DropdownMenuItem<Students>(
                                      onTap: () {
                                        _controller.result.student.customuser
                                            .id = student.customuser.id;
                                      },
                                      value: student,
                                      child: Text(student.customuser.lastName +
                                          ' ' +
                                          student.customuser.firstName),
                                    );
                                  }),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: size.height * 0.04),
                        Row(
                          children: [
                            GetBuilder<OtherControllers>(
                              init: OtherControllers(),
                              initState: (_) {},
                              builder: (controller) {
                                return Expanded(
                                  child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value.isBlank!) {
                                        return 'Please select a subject';
                                      }
                                      return null;
                                    },
                                    key: const ValueKey('subject'),
                                    isDense: true,
                                    onChanged: (Subject? value) {
                                      controller.subject = value!;
                                    },
                                    onSaved: (Subject? value) {
                                      _controller.result.session.id = value!.id;
                                    },
                                    decoration: const InputDecoration(
                                        isCollapsed: true,
                                        labelText: 'Subject'),
                                    items: List.generate(
                                        controller.subjectLists.length,
                                        (index) {
                                      Subject subject =
                                          controller.subjectLists[index];
                                      return DropdownMenuItem<Subject>(
                                        onTap: () {
                                          _controller.result.subject.id =
                                              subject.id;
                                        },
                                        value: subject,
                                        child: Text(subject.subjectName),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  if (!value.isNumericOnly) {
                                    return 'Please enter a numeric value';
                                  }
                                  return null;
                                },
                                autocorrect: true,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    labelText: 'Test 1',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FaIcon(Icons.format_list_numbered),
                                    )),
                                onSaved: (value) {
                                  _controller.result.test1 =
                                      double.parse(value!);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  if (!value.isNumericOnly) {
                                    return 'Please enter a numeric value';
                                  }
                                  return null;
                                },
                                autocorrect: true,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    labelText: 'Test 2',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FaIcon(Icons.format_list_numbered),
                                    )),
                                onSaved: (value) {
                                  _controller.result.test2 =
                                      double.parse(value!);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  if (!value.isNumericOnly) {
                                    return 'Please enter a numeric value';
                                  }
                                  return null;
                                },
                                autocorrect: true,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    labelText: 'Exam Score',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FaIcon(Icons.format_list_numbered),
                                    )),
                                onSaved: (value) {
                                  _controller.result.examScore =
                                      double.parse(value!);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.06),
                        DefaultButton(
                            text: 'Save Result',
                            press: () {
                              _controller.addResult(context);
                            })
                      ],
                    ),
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
