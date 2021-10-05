import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/student_controller.dart';

import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/models/student_result.dart';
import 'package:school_management_app/models/term.dart';

import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/utils/basic_utils.dart';

Term term = Term(id: 0, session: OtherControllers().session, title: '');

Students student = Students(
    customuser: user,
    id: 0,
    profilePic: '',
    gender: '',
    address: '',
    classId: classObj,
    sessionYearId: session,
    phoneNo: '',
    dob: '');

class ResultController extends GetxController {
  StudentResult result = StudentResult(
      classId: OtherControllers().classObj,
      session: OtherControllers().session,
      term: term,
      id: 0,
      student: student,
      subject: OtherControllers().subject,
      examScore: 0,
      test1: 0,
      test2: 0);
  final resultKey = GlobalKey<FormState>();

  void addResult(BuildContext context) async {
    final isValid = resultKey.currentState!.validate();

    if (isValid) {
      resultKey.currentState!.save();
      await ApiManagerPOST.addResult(result, context);
      resultKey.currentState!.reset();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }
}
