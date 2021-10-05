import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/customuser.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/services/api_manage_delete.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/services/response.dart';
import 'package:school_management_app/utils/basic_utils.dart';

var user = CustomUser();

class UserController extends GetxController {
  final RxBool _isVisible = false.obs;
  DateTime selectedDate = DateTime.now();

  List<Staffs> staffLists = [];
  // get staffLists => _staffLists;
  Staff staff = Staff(
      dob: '',
      phoneNo: '',
      customuser: user,
      address: '',
      gender: '',
      id: 0,
      profilePic: File(''));

  final staffFormKey = GlobalKey<FormState>();
  var isLoading = true.obs;
  ImagePicker? _imagePicker;
  File? image;
  TextEditingController dateValue = TextEditingController();
  bool get isVisbile => _isVisible.value;

  @override
  void onInit() {
    _imagePicker = ImagePicker();
    fetchStaffs();
    super.onInit();
  }

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

  void checkVisible() {
    _isVisible.toggle();
  }

  void selectPicture() async {
    final pickedFile = await _imagePicker!
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      File _pickedImage = File(pickedFile.path);
      staff.profilePic = _pickedImage;

      image = _pickedImage;
      update();
    }
  }

  void clearForm() {
    staffFormKey.currentState!.reset();
    image = null;
    update();
  }

  void selectFiles(Staff staff) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      staff.profilePic = file;

      image = file;

      update();
    } else {}
  }

  Future signUpStaff(BuildContext context) async {
    final isValid = staffFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    ;

    if (isValid) {
      staffFormKey.currentState!.save();
      try {
        isLoading(true);
        MyResponse response =
            await ApiManagerPOST().registerStaff(staff, context);
        if (response is Success) {
          // showSnackBar(context, text: 'Staff Added Successfully');

          clearForm();
          // return response;
        }
      } catch (e) {
        showSnackBar(context, text: e.toString());
      } finally {
        isLoading(false);
      }
    }
  }

  void fetchStaffs() async {
    try {
      isLoading(true);
      var staffs = await ApiManagerGET.getStaffs();
      if (staffs != null) {
        staffLists = staffs;
        update();
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    } finally {
      isLoading(false);
    }
  }

  void staffDelete(staffId, BuildContext context) async {
    await ApiManagerDelete.deleteStaff(staffId, context);
    update();
  }
}
