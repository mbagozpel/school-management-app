// import 'dart:convert';

// import 'package:school_management_app/models/classes.dart';
// import 'package:school_management_app/models/session.dart';

// class Attendance {
//   final int id;
//   final Classes classId;
//   final String attendanceDate;
//   final SessionYearModel sessionYearId;
//   Attendance({
//     required this.id,
//     required this.classId,
//     required this.attendanceDate,
//     required this.sessionYearId,
//   });

//   Attendance copyWith({
//     int? id,
//     Classes? classId,
//     String? attendanceDate,
//     SessionYearModel? sessionYearId,
//   }) {
//     return Attendance(
//       id: id ?? this.id,
//       classId: classId ?? this.classId,
//       attendanceDate: attendanceDate ?? this.attendanceDate,
//       sessionYearId: sessionYearId ?? this.sessionYearId,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'class_id': classId.toMap(),
//       'attendance_date': attendanceDate,
//       'session_year_id': sessionYearId.toMap(),
//     };
//   }

//   factory Attendance.fromMap(Map<String, dynamic> map) {
//     return Attendance(
//       id: map['id'],
//       classId: Classes.fromMap(map['classId']),
//       attendanceDate: map['attendance_date'],
//       sessionYearId: SessionYearModel.fromMap(map['session_year_id']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Attendance.fromJson(String source) =>
//       Attendance.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Attendance(id: $id, class_id: $classId, attendance_date: $attendanceDate, session_year_id: $sessionYearId)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Attendance &&
//         other.id == id &&
//         other.classId == classId &&
//         other.attendanceDate == attendanceDate &&
//         other.sessionYearId == sessionYearId;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         classId.hashCode ^
//         attendanceDate.hashCode ^
//         sessionYearId.hashCode;
//   }
// }
