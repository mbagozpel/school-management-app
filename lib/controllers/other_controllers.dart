import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/customuser.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/models/term.dart';
import 'package:school_management_app/services/api_manage_delete.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/services/api_manager_put.dart';
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

SessionYearModel termSession =
    SessionYearModel(id: 0, sessionStartYear: '', sessionEndYear: '');

class OtherControllers extends GetxController {
  Classes classObj = Classes(id: 0, className: '', staff: staff);
  Subject subject = Subject(id: 0, subjectName: '', staffId: staff);
  SessionYearModel session =
      SessionYearModel(id: 0, sessionStartYear: '', sessionEndYear: '');
  Term term = Term(id: 0, session: termSession, title: '');
  var selectedValue = staff;

  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();
  final subjectFormKey = GlobalKey<FormState>();
  final sessionFormKey = GlobalKey<FormState>();
  final editSessionFormKey = GlobalKey<FormState>();
  List<Classes> classLists = [];
  List<Subject> subjectLists = [];
  List<Term> termLists = [];
  List<SessionYearModel> sessionLists = [];
  var isLoading = true.obs;
  TextEditingController dateValue = TextEditingController();
  TextEditingController dateValue2 = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void onInit() {
    fetchClasses();
    fetchSubject();
    fetchSessions();
    fetchTerms();
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

  void selectDate2(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      dateValue2.text = DateFormat('yyyy-MM-dd').format(picked);
    }
    update();
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
    List<Classes>? classes = [];
    try {
      isLoading(true);
      classes = await ApiManagerGET.getClasses();

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

  void editClass(BuildContext context, Classes classObj) async {
    final isValid = editFormKey.currentState!.validate();

    if (isValid) {
      editFormKey.currentState!.save();
      await ApiManagerPUT.editClass(classObj, context);
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void addSubject(BuildContext context) async {
    final isValid = subjectFormKey.currentState!.validate();

    if (isValid) {
      subjectFormKey.currentState!.save();
      await ApiManagerPOST.addSubject(subject, context);
      subjectFormKey.currentState!.reset();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void fetchSubject() async {
    List<Subject>? subjects = [];
    try {
      isLoading(true);
      subjects = await ApiManagerGET.getSubjects();

      if (subjects != null) {
        subjectLists = subjects;

        update();
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    } finally {
      isLoading(false);
    }
  }

  void subjectDelete(subjectId, BuildContext context) async {
    await ApiManagerDelete.deleteSubject(subjectId, context);

    update();
  }

  void editSubject(BuildContext context, Subject subject) async {
    final isValid = editFormKey.currentState!.validate();

    if (isValid) {
      editFormKey.currentState!.save();
      await ApiManagerPUT.editSubject(subject, context);
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void addSession(BuildContext context) async {
    final isValid = sessionFormKey.currentState!.validate();

    if (isValid) {
      sessionFormKey.currentState!.save();
      await ApiManagerPOST.addSession(session, context);
      sessionFormKey.currentState!.reset();
      dateValue.clear();
      dateValue2.clear();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void fetchSessions() async {
    List<SessionYearModel>? sessions = [];
    try {
      isLoading(true);
      sessions = await ApiManagerGET.getSessions();

      if (sessions != null) {
        sessionLists = sessions;

        update();
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    } finally {
      isLoading(false);
    }
  }

  void editSession(BuildContext context, Subject subject) async {
    final isValid = editSessionFormKey.currentState!.validate();

    if (isValid) {
      editSessionFormKey.currentState!.save();
      await ApiManagerPUT.editSubject(subject, context);
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void fetchTerms() async {
    List<Term>? terms = [];
    try {
      isLoading(true);
      terms = await ApiManagerGET.getTerms();

      if (terms != null) {
        termLists = terms;

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
