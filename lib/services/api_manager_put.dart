import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/utils/basic_utils.dart';

import 'api.dart';

class ApiManagerPUT {
  static Future editClass(Classes classObj, BuildContext context) async {
    var formData = FormData.fromMap({
      'class_name': classObj.className,
      'staff_id': classObj.staff.customuser.id
    });
    try {
      var response = await dio.put('${Api.baseUrl}edit_class/${classObj.id}',
          data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Class Updated Successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future editSubject(Subject subject, BuildContext context) async {
    var formData = FormData.fromMap({
      'subject_name': subject.subjectName,
      'staff_id': subject.staffId.customuser.id
    });
    try {
      var response = await dio.put('${Api.baseUrl}edit_subject/${subject.id}',
          data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Subject Updated Successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future editSession(
      SessionYearModel session, BuildContext context) async {
    var formData = FormData.fromMap({
      'session_start_year': session.sessionStartYear,
      'session_end_year': session.sessionEndYear
    });
    try {
      var response = await dio.put('${Api.baseUrl}edit_session/${session.id}',
          data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Session Updated Successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }
}
