import 'package:dio/dio.dart' as res;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/staff.dart';
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
        Get.snackbar('title', 'Classes gotten',
            snackPosition: SnackPosition.BOTTOM);
        return Classes.classFromMap(response.data);
      } else {
        Get.snackbar('Error', 'An Error Occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }
}
