import 'dart:convert';

import 'staff.dart';

class FeedBackStaff {
  int id;
  Staffs staff;
  String feedback;
  String feedbackReply;
  FeedBackStaff({
    required this.id,
    required this.staff,
    required this.feedback,
    required this.feedbackReply,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'staff_id': staff.toMap(),
      'feedback': feedback,
      'feedback_reply': feedbackReply,
    };
  }

  factory FeedBackStaff.fromMap(Map<String, dynamic> map) {
    return FeedBackStaff(
      id: map['id'],
      staff: Staffs.fromMap(map['staff_id']),
      feedback: map['feedback'],
      feedbackReply: map['feedback_reply'],
    );
  }

  static List<FeedBackStaff> feedbackFromMap(dynamic source) =>
      List<FeedBackStaff>.from(source.map((x) => FeedBackStaff.fromMap(x)));
}
