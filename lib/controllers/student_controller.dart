import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/student.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/services/response.dart';
import 'package:school_management_app/utils/basic_utils.dart';

import 'other_controllers.dart';

var classObj = Classes(id: 0, className: '', staff: staff);
var session = SessionYearModel(id: 0, sessionStartYear: '', sessionEndYear: '');

class StudentController extends GetxController {
  final RxBool _isVisible = false.obs;
  DateTime selectedDate = DateTime.now();
  List<Students> studentList = [];
  final studentFormKey = GlobalKey<FormState>();
  var isLoading = true.obs;
  List<Students> classStudents = [];
  bool status = false;

  File? image;
  TextEditingController dateValue = TextEditingController();
  bool get isVisbile => _isVisible.value;
  Students students = Students(
      customuser: user,
      id: 0,
      profilePic: '',
      gender: '',
      address: '',
      classId: classObj,
      sessionYearId: session,
      phoneNo: '',
      dob: '');

  Student student = Student(
      customuser: user,
      id: 0,
      profilePic: File(''),
      gender: '',
      address: '',
      classId: classObj,
      sessionYearId: session,
      phoneNo: '',
      dob: '');

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void takeAttendance(value) {
    status = value;
    update();
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

  void clearForm() {
    studentFormKey.currentState!.reset();
    image = null;
    update();
  }

  void selectFiles(Student student) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      student.profilePic = file;

      image = file;

      update();
    } else {}
  }

  Future signUpStudent(BuildContext context) async {
    final isValid = studentFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    ;

    if (isValid) {
      studentFormKey.currentState!.save();
      try {
        isLoading(true);
        MyResponse response =
            await ApiManagerPOST().registerStudent(student, context);
        if (response is Success) {
          clearForm();
          dateValue.clear();
        }
      } catch (e) {
        showSnackBar(context, text: e.toString());
      } finally {
        isLoading(false);
      }
    }
  }

  void fetchStudents() async {
    {
      try {
        isLoading(true);
        var students = await ApiManagerGET.getStudents();

        if (students != null) {
          studentList = students;
          update();
        }
      } catch (e) {
        Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
        // showSnackBar(context, text: e.toString());
      } finally {
        isLoading(false);
      }
    }
  }

  void fetchClassStudents(BuildContext context,
      {required classId, required session}) async {
    List<Students>? classStudent = [];

    classStudent = (await ApiManagerGET.getClassStudents(classId, session));
    if (classStudent != null) {
      classStudents = classStudent;
    }
    update();
  }

  // void staffDelete(staffId, BuildContext context) async {
  //   await ApiManagerDelete.deleteStaff(staffId, context);
  //   update();
  // }
}
