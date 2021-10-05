import 'package:school_management_app/models/attendance.dart';

import 'student.dart';

class AttendanceReport {
  final int id;
  final Students student;
  final Attendance attendance;
  final bool status;
  AttendanceReport({
    required this.id,
    required this.student,
    required this.attendance,
    required this.status,
  });

  factory AttendanceReport.fromMap(Map<String, dynamic> map) {
    return AttendanceReport(
      id: map['id'],
      student: Students.fromMap(map['student_id']),
      attendance: Attendance.fromMap(map['attendance_id']),
      status: map['status'],
    );
  }
}
