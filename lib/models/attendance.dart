import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/term.dart';

class Attendance {
  int id;
  Term term;
  Classes classId;
  String attendanceDate;
  SessionYearModel sessionYearId;
  Attendance({
    required this.id,
    required this.term,
    required this.classId,
    required this.attendanceDate,
    required this.sessionYearId,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      id: map['id'],
      term: map['term'],
      classId: Classes.fromMap(map['classId']),
      attendanceDate: map['attendance_date'],
      sessionYearId: SessionYearModel.fromMap(map['session_year_id']),
    );
  }
}
