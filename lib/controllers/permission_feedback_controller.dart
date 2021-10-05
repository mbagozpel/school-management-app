import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_app/models/feedback_staff.dart';
import 'package:school_management_app/models/permission_staff.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/utils/basic_utils.dart';

import 'other_controllers.dart';

class FeedbackPermissionController extends GetxController {
  PermissionReportStaff permissionReportStaff = PermissionReportStaff(
      id: 0,
      staff: staff,
      permissionStartDate: '',
      permissionEndDate: '',
      permissionMessage: '',
      permissionStatus: 0);
  var isLoading = true.obs;
  final staffCommentkey = GlobalKey<FormState>();
  final permissionKey = GlobalKey<FormState>();
  FeedBackStaff feedback =
      FeedBackStaff(id: 0, staff: staff, feedback: '', feedbackReply: '');
  List<FeedBackStaff> staffFeedback = [];
  List<PermissionReportStaff> staffPermission = [];
  TextEditingController dateValue = TextEditingController();
  TextEditingController dateValue2 = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void onInit() {
    fetchIndividualStaffFeedbacks();
    fetchIndividualStaffRequest();
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

  void staffSendFeedback(BuildContext context) async {
    final isValid = staffCommentkey.currentState!.validate();

    if (isValid) {
      staffCommentkey.currentState!.save();
      await ApiManagerPOST.staffSendFeedback(feedback, context);
      staffCommentkey.currentState!.reset();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void fetchIndividualStaffFeedbacks() async {
    List<FeedBackStaff>? feedbacks = [];
    try {
      isLoading(true);
      feedbacks = await ApiManagerGET.getIndividualStaffFeedBacks(1);

      if (feedbacks != null) {
        staffFeedback = feedbacks;

        update();
      }
    } catch (e) {
      Get.snackbar('', e.toString(), snackPosition: SnackPosition.BOTTOM);
      // showSnackBar(context, text: e.toString());
    } finally {
      isLoading(false);
    }
  }

  void staffAskPermission(BuildContext context) async {
    final isValid = permissionKey.currentState!.validate();

    if (isValid) {
      permissionKey.currentState!.save();
      await ApiManagerPOST.staffRequestPermission(
          permissionReportStaff, context);
      permissionKey.currentState!.reset();
      dateValue.clear();
      dateValue2.clear();
    } else {
      showSnackBar(context, text: 'Confirm your data inputs');
    }
  }

  void fetchIndividualStaffRequest() async {
    List<PermissionReportStaff>? permission = [];
    try {
      isLoading(true);
      permission = await ApiManagerGET.getIndividualStaffRequest(1);

      if (permission != null) {
        staffPermission = permission;

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
