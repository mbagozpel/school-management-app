// import 'dart:convert';

// import 'package:school_management_app/models/classes.dart';
// import 'package:school_management_app/models/staff.dart';
// import 'package:school_management_app/models/subject.dart';

// class Assignment {
//   final int id;
//   final Staff staff;
//   final String title;
//   final Classes classId;
//   final Subject subject;
//   Assignment({
//     required this.id,
//     required this.staff,
//     required this.title,
//     required this.classId,
//     required this.subject,
//   });

//   Assignment copyWith({
//     int? id,
//     Staff? staff,
//     String? title,
//     Classes? classId,
//     Subject? subject,
//   }) {
//     return Assignment(
//       id: id ?? this.id,
//       staff: staff ?? this.staff,
//       title: title ?? this.title,
//       classId: classId ?? this.classId,
//       subject: subject ?? this.subject,
//     );
//   }

//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'id': id,
//   //     'staff': staff.toMap(),
//   //     'title': title,
//   //     'class_id': classId.toMap(),
//   //     'subject': subject.toMap(),
//   //   };
//   // }

//   // factory Assignment.fromMap(Map<String, dynamic> map) {
//   //   return Assignment(
//   //     id: map['id'],
//   //     staff: Staff.fromMap(map['staff']),
//   //     title: map['title'],
//   //     classId: Classes.fromMap(map['class_id']),
//   //     subject: Subject.fromMap(map['subject']),
//   //   );
//   // }

//   // String toJson() => json.encode(toMap());

//   // factory Assignment.fromJson(String source) =>
//   //     Assignment.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Assignment(id: $id, staff: $staff, title: $title, class_id: $classId, subject: $subject)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Assignment &&
//         other.id == id &&
//         other.staff == staff &&
//         other.title == title &&
//         other.classId == classId &&
//         other.subject == subject;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         staff.hashCode ^
//         title.hashCode ^
//         classId.hashCode ^
//         subject.hashCode;
//   }
// }
