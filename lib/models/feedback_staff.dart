// import 'dart:convert';

// import 'staff.dart';

// class FeedBackStaff {
//   final int id;
//   final Staff staff;
//   final String feedback;
//   final String feedbackReply;
//   FeedBackStaff({
//     required this.id,
//     required this.staff,
//     required this.feedback,
//     required this.feedbackReply,
//   });

//   FeedBackStaff copyWith({
//     int? id,
//     Staff? staff,
//     String? feedback,
//     String? feedbackReply,
//   }) {
//     return FeedBackStaff(
//       id: id ?? this.id,
//       staff: staff ?? this.staff,
//       feedback: feedback ?? this.feedback,
//       feedbackReply: feedbackReply ?? this.feedbackReply,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'staff_id': staff.toMap(),
//       'feedback': feedback,
//       'feedback_reply': feedbackReply,
//     };
//   }

//   factory FeedBackStaff.fromMap(Map<String, dynamic> map) {
//     return FeedBackStaff(
//       id: map['id'],
//       staff: Staff.fromMap(map['staff_id']),
//       feedback: map['feedback'],
//       feedbackReply: map['feedback_reply'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory FeedBackStaff.fromJson(String source) =>
//       FeedBackStaff.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'FeedBackStaff(id: $id, staff_id: $staff, feedback: $feedback, feedback_reply: $feedbackReply)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is FeedBackStaff &&
//         other.id == id &&
//         other.staff == staff &&
//         other.feedback == feedback &&
//         other.feedbackReply == feedbackReply;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         staff.hashCode ^
//         feedback.hashCode ^
//         feedbackReply.hashCode;
//   }
// }
