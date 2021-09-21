import 'dart:convert';

import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/staff.dart';

class Subject {
  final int id;
  final String subjectName;
  final Classes classId;
  final Staff staffId;
  Subject({
    required this.id,
    required this.subjectName,
    required this.classId,
    required this.staffId,
  });

  Subject copyWith({
    int? id,
    String? subjectName,
    Classes? classId,
    Staff? staffId,
  }) {
    return Subject(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      classId: classId ?? this.classId,
      staffId: staffId ?? this.staffId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject_name': subjectName,
      'class_id': classId.toMap(),
      'staff_id': staffId.toMap(),
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      subjectName: map['subject_name'],
      classId: Classes.fromMap(map['class_id']),
      staffId: Staff.fromMap(map['staff_id']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Subject(id: $id, subject_name: $subjectName, class_id: $classId, staff_id: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subject &&
        other.id == id &&
        other.subjectName == subjectName &&
        other.classId == classId &&
        other.staffId == staffId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subjectName.hashCode ^
        classId.hashCode ^
        staffId.hashCode;
  }
}
