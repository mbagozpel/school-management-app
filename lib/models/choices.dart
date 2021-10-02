// import 'dart:convert';

// import 'package:school_management_app/models/assignment.dart';

// class Choice {
//   final int id;
//   final String title;
//   final Assignment assignment;
//   Choice({
//     required this.id,
//     required this.title,
//     required this.assignment,
//   });

//   Choice copyWith({
//     int? id,
//     String? title,
//     Assignment? assignment,
//   }) {
//     return Choice(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       assignment: assignment ?? this.assignment,
//     );
//   }

//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'id': id,
//   //     'title': title,
//   //     'assignment': assignment.toMap(),
//   //   };
//   // }

//   // factory Choice.fromMap(Map<String, dynamic> map) {
//   //   return Choice(
//   //     id: map['id'],
//   //     title: map['title'],
//   //     assignment: Assignment.fromMap(map['assignment']),
//   //   );
//   // }

//   // String toJson() => json.encode(toMap());

//   // factory Choice.fromJson(String source) => Choice.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Choice(id: $id, title: $title, assignment: $assignment)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Choice &&
//         other.id == id &&
//         other.title == title &&
//         other.assignment == assignment;
//   }

//   @override
//   int get hashCode => id.hashCode ^ title.hashCode ^ assignment.hashCode;
// }
