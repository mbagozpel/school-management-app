// import 'dart:convert';

// import 'package:school_management_app/models/subject.dart';

// import 'student.dart';

// class StudentResult {
//   final int id;
//   final Student student;
//   final Subject subject;
//   final double examScore;
//   final double test1;
//   final double test2;
//   StudentResult({
//     required this.id,
//     required this.student,
//     required this.subject,
//     required this.examScore,
//     required this.test1,
//     required this.test2,
//   });

//   StudentResult copyWith({
//     int? id,
//     Student? student,
//     Subject? subject,
//     double? examScore,
//     double? test1,
//     double? test2,
//   }) {
//     return StudentResult(
//       id: id ?? this.id,
//       student: student ?? this.student,
//       subject: subject ?? this.subject,
//       examScore: examScore ?? this.examScore,
//       test1: test1 ?? this.test1,
//       test2: test2 ?? this.test2,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'student_id': student.toMap(),
//       'subject_id': subject.toMap(),
//       'subject_exam_marks': examScore,
//       'subject_text_one': test1,
//       'subject_text_two': test2,
//     };
//   }

//   factory StudentResult.fromMap(Map<String, dynamic> map) {
//     return StudentResult(
//       id: map['id'],
//       student: Student.fromMap(map['student_id']),
//       subject: Subject.fromMap(map['subject_id']),
//       examScore: map['subject_exam_marks'],
//       test1: map['subject_text_one'],
//       test2: map['subject_text_two'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory StudentResult.fromJson(String source) =>
//       StudentResult.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'StudentResult(id: $id, student_id: $student, subject_id: $subject, subject_exam_marks: $examScore, subject_text_one: $test1, subject_text_two: $test2)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is StudentResult &&
//         other.id == id &&
//         other.student == student &&
//         other.subject == subject &&
//         other.examScore == examScore &&
//         other.test1 == test1 &&
//         other.test2 == test2;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         student.hashCode ^
//         subject.hashCode ^
//         examScore.hashCode ^
//         test1.hashCode ^
//         test2.hashCode;
//   }
// }
