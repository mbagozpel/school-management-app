import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/views/admin/manage_class.dart';
import 'package:school_management_app/views/admin/add_class.dart';
import 'package:school_management_app/views/admin/add_session.dart';
import 'package:school_management_app/views/admin/add_staff/add_staff.dart';
import 'package:school_management_app/views/admin/add_student/add_student.dart';
import 'package:school_management_app/views/admin/add_subject.dart';

import 'package:school_management_app/views/admin/dashboard.dart';
import 'package:school_management_app/views/admin/manage_staffs.dart';
import 'package:school_management_app/views/admin/manage_students.dart';
import 'package:school_management_app/views/admin/manage_subject.dart';
import 'package:school_management_app/views/admin/staff_feedback.dart';
import 'package:school_management_app/views/admin/staff_permission.dart';
import 'package:school_management_app/views/admin/student_feedback.dart';
import 'package:school_management_app/views/admin/student_permission.dart';
import 'package:school_management_app/views/admin/view_attendance.dart';
import 'package:school_management_app/views/staff/add_result.dart';
import 'package:school_management_app/views/staff/create_assignment.dart';
import 'package:school_management_app/views/staff_suggestion.dart';
import 'package:school_management_app/views/staff/take_attendance.dart';
import 'package:school_management_app/views/take_permission.dart';
import 'package:school_management_app/views/staff/update_attendance.dart';
import 'package:school_management_app/views/student/student_view_attendance.dart';

class SideBarModel {
  final String title;
  final IconData icon;
  final Widget? widget;

  const SideBarModel({required this.title, required this.icon, this.widget});
}

List<SideBarModel> adminSideBar = [
  const SideBarModel(
    title: 'Admin',
    icon: FontAwesomeIcons.home,
    widget: Dashboard(),
  ),
  const SideBarModel(
      title: 'Add Staff', widget: AddStaff(), icon: FontAwesomeIcons.user),
  const SideBarModel(
      title: 'Manage Staffs',
      widget: ManageStaff(),
      icon: FontAwesomeIcons.user),
  const SideBarModel(
      title: 'Add Class',
      widget: AddClass(),
      icon: FontAwesomeIcons.addressBook),
  const SideBarModel(
      title: 'Manage Class',
      widget: ManageClass(),
      icon: FontAwesomeIcons.user),
  const SideBarModel(
      title: 'Add Subject', widget: AddSubject(), icon: FontAwesomeIcons.book),
  const SideBarModel(
      title: 'Manage Subject',
      widget: ManageSubject(),
      icon: FontAwesomeIcons.user),
  SideBarModel(
      title: 'Add Session',
      widget: AddSession(),
      icon: FontAwesomeIcons.addressCard),
  const SideBarModel(
      title: 'Add Students',
      widget: AddStudent(),
      icon: FontAwesomeIcons.users),
  const SideBarModel(
      title: 'Manage Students',
      widget: ManageStudent(),
      icon: FontAwesomeIcons.user),
  const SideBarModel(
      title: 'Staff Comments',
      widget: StaffFeedback(),
      icon: FontAwesomeIcons.reply),
  const SideBarModel(
      title: 'Student\'s Comments',
      widget: StudentFeedback(),
      icon: FontAwesomeIcons.reply),
  const SideBarModel(
      title: 'Staff Permissions',
      widget: StaffPermissions(),
      icon: FontAwesomeIcons.freeCodeCamp),
  const SideBarModel(
      title: 'Student\'s Permissions',
      widget: StudentPermissions(),
      icon: FontAwesomeIcons.freeCodeCamp),
  SideBarModel(
      title: 'Class Register',
      widget: ViewAttendance(),
      icon: FontAwesomeIcons.userCircle),
  const SideBarModel(
      title: 'Time Table',
      widget: Dashboard(),
      icon: FontAwesomeIcons.timesCircle),
  const SideBarModel(
      title: 'Staff Notifications',
      widget: Dashboard(),
      icon: FontAwesomeIcons.bell),
  const SideBarModel(
      title: 'Student Notifications',
      widget: Dashboard(),
      icon: Icons.notifications)
];

List<SideBarModel> staffSideBar = [
  const SideBarModel(
      title: 'Staff', widget: Dashboard(), icon: FontAwesomeIcons.home),
  const SideBarModel(
      title: 'Take Attendance',
      widget: TakeAttendance(),
      icon: FontAwesomeIcons.userCheck),
  const SideBarModel(
      title: 'Manage Attendance',
      widget: ManageAttendance(),
      icon: FontAwesomeIcons.userCircle),
  const SideBarModel(
      title: 'Create Assignment', widget: Assignment(), icon: Icons.assessment),
  const SideBarModel(
      title: 'Permission Request',
      widget: PermissionRequest(),
      icon: FontAwesomeIcons.freeCodeCamp),
  const SideBarModel(
      title: 'Suggestions',
      widget: StaffSuggestions(),
      icon: FontAwesomeIcons.comment),
  const SideBarModel(
      title: 'Add Result',
      widget: AddResult(),
      icon: FontAwesomeIcons.bookReader),
  const SideBarModel(
      title: 'Notifications', widget: Dashboard(), icon: Icons.notifications)
];

List<SideBarModel> studentSideBar = [
  const SideBarModel(
      title: 'Student', widget: Dashboard(), icon: FontAwesomeIcons.home),
  const SideBarModel(
      title: 'View Attendance',
      widget: StudentViewAttendance(),
      icon: FontAwesomeIcons.userCheck),
  const SideBarModel(
      title: 'Permission Request',
      widget: PermissionRequest(),
      icon: FontAwesomeIcons.freeCodeCamp),
  const SideBarModel(
      title: 'Complains',
      widget: StaffSuggestions(),
      icon: FontAwesomeIcons.comment),
  const SideBarModel(
      title: 'View Result',
      widget: AddResult(),
      icon: FontAwesomeIcons.bookReader),
  const SideBarModel(
      title: 'Notifications', widget: Dashboard(), icon: Icons.notifications)
];
