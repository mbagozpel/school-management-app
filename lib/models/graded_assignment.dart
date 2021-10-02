// import 'dart:convert';

// import 'package:school_management_app/models/assignment.dart';
// import 'package:school_management_app/models/student.dart';

// class GradedAssignment {
//   final int id;
//   final Student student;
//   final Assignment assignment;
//   final double grade;
//   GradedAssignment({
//     required this.id,
//     required this.student,
//     required this.assignment,
//     required this.grade,
//   });

//   GradedAssignment copyWith({
//     int? id,
//     Student? student,
//     Assignment? assignment,
//     double? grade,
//   }) {
//     return GradedAssignment(
//       id: id ?? this.id,
//       student: student ?? this.student,
//       assignment: assignment ?? this.assignment,
//       grade: grade ?? this.grade,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'student_id': student.toMap(),
//       'assignment_id': assignment.toMap(),
//       'grade': grade,
//     };
//   }

//   factory GradedAssignment.fromMap(Map<String, dynamic> map) {
//     return GradedAssignment(
//       id: map['id'],
//       student: Student.fromMap(map['student_id']),
//       assignment: Assignment.fromMap(map['assignment_id']),
//       grade: map['grade'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory GradedAssignment.fromJson(String source) =>
//       GradedAssignment.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'GradedAssignment(id: $id, student_id: $student, assignment_id: $assignment, grade: $grade)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is GradedAssignment &&
//         other.id == id &&
//         other.student == student &&
//         other.assignment == assignment &&
//         other.grade == grade;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         student.hashCode ^
//         assignment.hashCode ^
//         grade.hashCode;
//   }
// }
