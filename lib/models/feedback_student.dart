// import 'dart:convert';

// import 'package:school_management_app/models/student.dart';

// class FeedBackStudent {
//   final int id;
//   final Student student;
//   final String feedback;
//   final String feedbackReply;
//   FeedBackStudent({
//     required this.id,
//     required this.student,
//     required this.feedback,
//     required this.feedbackReply,
//   });

//   FeedBackStudent copyWith({
//     int? id,
//     Student? student,
//     String? feedback,
//     String? feedbackReply,
//   }) {
//     return FeedBackStudent(
//       id: id ?? this.id,
//       student: student ?? this.student,
//       feedback: feedback ?? this.feedback,
//       feedbackReply: feedbackReply ?? this.feedbackReply,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'student_id': student.toMap(),
//       'feedback': feedback,
//       'feedback_reply': feedbackReply,
//     };
//   }

//   factory FeedBackStudent.fromMap(Map<String, dynamic> map) {
//     return FeedBackStudent(
//       id: map['id'],
//       student: Student.fromMap(map['student_id']),
//       feedback: map['feedback'],
//       feedbackReply: map['feedback_reply'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory FeedBackStudent.fromJson(String source) =>
//       FeedBackStudent.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'FeedBackStudent(id: $id, student_id: $student, feedback: $feedback, feedback_reply: $feedbackReply)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is FeedBackStudent &&
//         other.id == id &&
//         other.student == student &&
//         other.feedback == feedback &&
//         other.feedbackReply == feedbackReply;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         student.hashCode ^
//         feedback.hashCode ^
//         feedbackReply.hashCode;
//   }
// }
