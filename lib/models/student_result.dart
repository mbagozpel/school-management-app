import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/models/subject.dart';

import 'student.dart';
import 'term.dart';

class StudentResult {
  int id;
  Students student;
  Subject subject;
  double examScore;
  double test1;
  double test2;
  Classes classId;
  Term term;
  SessionYearModel session;
  StudentResult({
    required this.classId,
    required this.session,
    required this.term,
    required this.id,
    required this.student,
    required this.subject,
    required this.examScore,
    required this.test1,
    required this.test2,
  });

  factory StudentResult.fromMap(Map<String, dynamic> map) {
    return StudentResult(
      session: map['session'],
      classId: map['classId'],
      id: map['id'],
      term: map['term'],
      student: Students.fromMap(map['student_id']),
      subject: Subject.fromMap(map['subject_id']),
      examScore: map['subject_exam_marks'],
      test1: map['subject_text_one'],
      test2: map['subject_text_two'],
    );
  }

  static List<StudentResult> resultFromMap(dynamic source) =>
      List<StudentResult>.from(source.map((x) => StudentResult.fromMap(x)));
}
