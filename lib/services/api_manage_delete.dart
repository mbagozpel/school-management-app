import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/utils/basic_utils.dart';

import 'api.dart';

class ApiManagerDelete {
  static deleteStaff(staffId, BuildContext context) async {
    try {
      var response = await dio.delete(
        '${Api.baseUrl}delete_staff/$staffId',
      );

      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Staff deleted successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static deleteClass(classId, BuildContext context) async {
    try {
      var response = await dio.delete(
        '${Api.baseUrl}delete_class/$classId',
      );

      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Class deleted successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static deleteSubject(subjectId, BuildContext context) async {
    try {
      var response = await dio.delete(
        '${Api.baseUrl}delete_subject/$subjectId',
      );

      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Subject deleted successfully');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }
}
