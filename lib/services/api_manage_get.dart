import 'package:dio/dio.dart' as res;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/feedback_staff.dart';
import 'package:school_management_app/models/permission_staff.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/models/term.dart';
import 'package:school_management_app/services/api.dart';
import 'package:school_management_app/utils/basic_utils.dart';

class ApiManagerGET {
  static Future<List<Staffs>?> getStaffs() async {
    try {
      res.Response response = await dio.get(Api.getStaffs);

      if (response.statusCode == 200) {
        return Staffs.staffFromMap(response.data);
      } else {
        // showSnackBar(context,
        //     text: 'An error occurred, check your internet connection');
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
        return null;
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    }
  }

  static Future<List<Classes>?> getClasses() async {
    try {
      res.Response response = await dio.get(Api.getClasses);

      if (response.statusCode == 200) {
        // print(response.data);
        return Classes.classFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<Subject>?> getSubjects() async {
    try {
      res.Response response = await dio.get(Api.getSubjects);

      if (response.statusCode == 200) {
        // print(response.data);

        return Subject.subjectFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<SessionYearModel>?> getSessions() async {
    try {
      res.Response response = await dio.get(Api.getSessions);

      if (response.statusCode == 200) {
        // print(response.data);

        return SessionYearModel.sessionFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<Students>?> getStudents() async {
    try {
      res.Response response = await dio.get(Api.getStudents);

      if (response.statusCode == 200) {
        // print(response.data);
        return Students.studentFromMap(response.data);
      } else {
        // showSnackBar(context,
        //     text: 'An error occurred, check your internet connection');
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
        return null;
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    }
  }

  static Future<List<FeedBackStaff>?> getStaffFeedBacks() async {
    try {
      res.Response response = await dio.get(Api.getStaffFeedbacks);

      if (response.statusCode == 200) {
        // print(response.data);
        return FeedBackStaff.feedbackFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<FeedBackStaff>?> getIndividualStaffFeedBacks(
      staffId) async {
    try {
      res.Response response = await dio
          .get('${Api.baseUrl}get_individual_staff_feedbacks/$staffId');

      if (response.statusCode == 200) {
        // print(response.data);
        return FeedBackStaff.feedbackFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<PermissionReportStaff>?> getIndividualStaffRequest(
      staffId) async {
    try {
      res.Response response = await dio
          .get('${Api.baseUrl}get_individual_staff_permission/$staffId');

      if (response.statusCode == 200) {
        // print(response.data);
        return PermissionReportStaff.staffPermFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<Students>?> getClassStudents(classId, sessionId) async {
    try {
      var formData = res.FormData.fromMap(
          {'class_id': classId, 'session_year_id': sessionId});
      res.Response response =
          await dio.post(Api.getClassStudents, data: formData);

      if (response.statusCode == 200) {
        // print(response.data);
        return Students.studentFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }

  static Future<List<Term>?> getTerms() async {
    try {
      res.Response response = await dio.get(Api.getTerms);

      if (response.statusCode == 200) {
        return Term.termFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }
}
