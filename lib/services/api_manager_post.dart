import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_management_app/models/attendance.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/feedback_staff.dart';
import 'package:school_management_app/models/permission_staff.dart';
import 'package:school_management_app/models/session.dart';

import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/models/student_result.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:school_management_app/services/response.dart';
import 'package:school_management_app/utils/basic_utils.dart';
import 'package:school_management_app/views/admin/staff_feedback.dart';
import 'package:school_management_app/views/staff/add_result.dart';

class ApiManagerPOST {
  Future<bool?> checkUsernameExists(staff) async {
    // var url = Uri.parse(Api.checkUsernameExists);
    var response = await dio.post(Api.checkUsernameExists,
        data: {"username": staff.customuser.username});

    if (response.statusCode == 200) {
      if (response.data == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<MyResponse> registerStaff(Staff staff, BuildContext context) async {
    if (await checkUsernameExists(staff) == true) {
      showSnackBar(context, text: 'Username already exists');
      return MyResponse.error('');
    } else {
      // var url = Uri.parse(Api.addStaff);

      var formData = FormData.fromMap({
        'first_name': staff.customuser.firstName,
        'last_name': staff.customuser.lastName,
        'username': staff.customuser.username,
        'password': staff.customuser.password,
        'email': staff.customuser.email,
        'gender': staff.gender,
        'address': staff.address,
        'dob': staff.dob,
        'phone_number': staff.phoneNo,
        'profile_pic': await MultipartFile.fromFile(staff.profilePic.path,
            filename: '${staff.customuser.username}/profile_pic')
      });
      try {
        var response = await dio.post(Api.addStaff, data: formData);

        if (response.statusCode == 200) {
          showSnackBar(context, text: 'Staff added Successfully');
          return MyResponse.success(response.data);
        } else {
          showSnackBar(context,
              text: 'An error occurred, please check your internet connection');
          return MyResponse.error('');
        }
      } catch (e) {
        showSnackBar(context, text: e.toString());
        return MyResponse.error(e.toString());
      }
    }
  }

  static Future addClass(Classes classObj, BuildContext context) async {
    var formData = FormData.fromMap({
      'class_name': classObj.className,
      'staff_id': classObj.staff.customuser.id
    });
    try {
      var response = await dio.post(Api.addClass, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Class successfully added');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future addSubject(Subject subject, BuildContext context) async {
    var formData = FormData.fromMap({
      'subject_name': subject.subjectName,
      'staff_id': subject.staffId.customuser.id
    });
    try {
      var response = await dio.post(Api.addSubject, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Subject successfully added');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future addSession(
      SessionYearModel session, BuildContext context) async {
    var formData = FormData.fromMap({
      'session_start_year': session.sessionStartYear,
      'session_end_year': session.sessionEndYear,
    });
    try {
      var response = await dio.post(Api.addSession, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Session successfully added');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  Future<MyResponse> registerStudent(
      Student student, BuildContext context) async {
    if (await checkUsernameExists(student) == true) {
      showSnackBar(context, text: 'Username already exists');
      return MyResponse.error('');
    } else {
      // var url = Uri.parse(Api.addStaff);

      var formData = FormData.fromMap({
        'first_name': student.customuser.firstName,
        'last_name': student.customuser.lastName,
        'username': student.customuser.username,
        'password': student.customuser.password,
        'email': student.customuser.email,
        'gender': student.gender,
        'address': student.address,
        'class_id': student.classId.id,
        'session_year_id': student.sessionYearId.id,
        'dob': student.dob,
        'phone_number': student.phoneNo,
        'profile_pic': await MultipartFile.fromFile(student.profilePic.path,
            filename: '${student.customuser.username}/profile_pic')
      });
      try {
        var response = await dio.post(Api.addStudent, data: formData);

        if (response.statusCode == 200) {
          showSnackBar(context, text: 'Student added Successfully');
          return MyResponse.success(response.data);
        } else {
          showSnackBar(context,
              text: 'An error occurred, please check your internet connection');
          return MyResponse.error('');
        }
      } catch (e) {
        showSnackBar(context, text: e.toString());
        return MyResponse.error(e.toString());
      }
    }
  }

  static Future staffSendFeedback(
      FeedBackStaff feedback, BuildContext context) async {
    var formData = FormData.fromMap({
      'staff_id': 6,
      // feedback.staff.id,
      'feedback': feedback.feedback,
      'feedback_reply': feedback.feedbackReply
    });
    try {
      var response = await dio.post(Api.staffSendFeedback, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Comment successfully sent');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future staffRequestPermission(
      PermissionReportStaff permissionReportStaff, BuildContext context) async {
    var formData = FormData.fromMap({
      'staff_id': 1,
      // permissionReportStaff.staff.id,
      'permission_start_date': permissionReportStaff.permissionStartDate,
      'permission_end_date': permissionReportStaff.permissionEndDate,
      'permission_message': permissionReportStaff.permissionMessage
    });
    try {
      var response = await dio.post(Api.staffAskPermission, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Request successfully sent');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future addResult(StudentResult result, BuildContext context) async {
    var formData = FormData.fromMap({
      'student_id': result.student.customuser.id,
      'subject_id': result.subject.id,
      'term': result.term.id,
      'session': result.session.id,
      'subject_exam_marks': result.examScore,
      'subject_text_one': result.test1,
      'subject_text_two': result.test2,
      'class_id': result.classId.id,
    });
    try {
      var response = await dio.post(Api.computeStudentResult, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Result successfully added');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }

  static Future takeAttendance(
      studentIds, Attendance attendance, BuildContext context) async {
    var formData = FormData.fromMap({
      'student_ids': studentIds,
      'term': attendance.term.id,
      'session': attendance.sessionYearId.id,
      'attendance_date': attendance.attendanceDate,
      'class_id': attendance.classId.id,
    });
    try {
      var response = await dio.post(Api.takeAttendanceData, data: formData);
      if (response.statusCode == 200) {
        showSnackBar(context, text: 'Attendance successfully saved');
      } else {
        showSnackBar(context, text: 'An error occurred');
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }
  }
}
