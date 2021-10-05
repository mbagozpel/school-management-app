import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_app/controllers/result_controller.dart';
import 'package:school_management_app/models/attendance.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/utils/basic_utils.dart';

import 'other_controllers.dart';

class AttendanceController extends GetxController {
  final attendanceKey = GlobalKey<FormState>();
  final Attendance attendance = Attendance(
      attendanceDate: '',
      classId: OtherControllers().classObj,
      term: OtherControllers().term,
      id: 0,
      sessionYearId: OtherControllers().session);
  TextEditingController dateValue = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isPresent = false;

  void selectDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      dateValue.text = DateFormat('yyyy-MM-dd').format(picked);
    }
    update();
  }

  void takeAttendace(BuildContext context, studentIds) async {
    final isValid = attendanceKey.currentState!.validate();

    if (isValid) {
      attendanceKey.currentState!.save();
      await ApiManagerPOST.takeAttendance(attendance, studentIds, context);
      attendanceKey.currentState!.reset();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }
}
