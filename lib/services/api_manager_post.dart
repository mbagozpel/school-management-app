import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_management_app/models/classes.dart';

import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:school_management_app/services/response.dart';
import 'package:school_management_app/utils/basic_utils.dart';

class ApiManagerPOST {
  Future<bool?> checkUsernameExists(Staff staff) async {
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
}
