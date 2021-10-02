import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/customuser.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/services/api_manage_delete.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/utils/basic_utils.dart';

var user = CustomUser();
var staff = Staffs(
    address: '',
    id: 0,
    phoneNo: '',
    customuser: user,
    dob: '',
    gender: '',
    profilePic: '');

class OtherControllers extends GetxController {
  Classes classObj = Classes(id: 0, className: '', staff: staff);
  var selectedValue = staff;
  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();
  List<Classes> classLists = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchClasses();
    super.onInit();
  }

  void addClass(BuildContext context) async {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      await ApiManagerPOST.addClass(classObj, context);
      formKey.currentState!.reset();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void selectStaff(value) {
    selectedValue = value;
    update();
  }

  void fetchClasses() async {
    try {
      isLoading(true);
      var classes = await ApiManagerGET.getClasses();

      if (classes != null) {
        classLists = classes;

        update();
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    } finally {
      isLoading(false);
    }
  }

  void classDelete(classId, BuildContext context) async {
    await ApiManagerDelete.deleteClass(classId, context);

    update();
  }
}
