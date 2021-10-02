// import 'dart:convert';

// import 'package:school_management_app/models/attendance.dart';

// import 'student.dart';

// class AttendanceReport {
//   final int id;
//   final Student student;
//   final Attendance attendance;
//   final bool status;
//   AttendanceReport({
//     required this.id,
//     required this.student,
//     required this.attendance,
//     required this.status,
//   });

//   AttendanceReport copyWith({
//     int? id,
//     Student? student,
//     Attendance? attendance,
//     bool? status,
//   }) {
//     return AttendanceReport(
//       id: id ?? this.id,
//       student: student ?? this.student,
//       attendance: attendance ?? this.attendance,
//       status: status ?? this.status,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'student_id': student.toMap(),
//       'attendance_id': attendance.toMap(),
//       'status': status,
//     };
//   }

//   factory AttendanceReport.fromMap(Map<String, dynamic> map) {
//     return AttendanceReport(
//       id: map['id'],
//       student: Student.fromMap(map['student_id']),
//       attendance: Attendance.fromMap(map['attendance_id']),
//       status: map['status'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AttendanceReport.fromJson(String source) =>
//       AttendanceReport.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'AttendanceReport(id: $id, student_id: $student, attendance_id: $attendance, status: $status)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is AttendanceReport &&
//         other.id == id &&
//         other.student == student &&
//         other.attendance == attendance &&
//         other.status == status;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         student.hashCode ^
//         attendance.hashCode ^
//         status.hashCode;
//   }
// }
