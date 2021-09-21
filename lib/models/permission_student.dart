import 'dart:convert';

import 'student.dart';

class PermissionReportStudent {
  final int id;
  final Student student;
  final String permissionDate;
  final String permissionMessage;
  final int permissionStatus;
  PermissionReportStudent({
    required this.id,
    required this.student,
    required this.permissionDate,
    required this.permissionMessage,
    required this.permissionStatus,
  });

  PermissionReportStudent copyWith({
    int? id,
    Student? student,
    String? permissionDate,
    String? permissionMessage,
    int? permissionStatus,
  }) {
    return PermissionReportStudent(
      id: id ?? this.id,
      student: student ?? this.student,
      permissionDate: permissionDate ?? this.permissionDate,
      permissionMessage: permissionMessage ?? this.permissionMessage,
      permissionStatus: permissionStatus ?? this.permissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': student.toMap(),
      'permission_date': permissionDate,
      'permission_message': permissionMessage,
      'permission_status': permissionStatus,
    };
  }

  factory PermissionReportStudent.fromMap(Map<String, dynamic> map) {
    return PermissionReportStudent(
      id: map['id'],
      student: Student.fromMap(map['student_id']),
      permissionDate: map['permission_date'],
      permissionMessage: map['permission_message'],
      permissionStatus: map['permission_status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionReportStudent.fromJson(String source) =>
      PermissionReportStudent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PermissionReportStudent(id: $id, student_id: $student, permission_date: $permissionDate, permission_message: $permissionMessage, permissionStatus: $permissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PermissionReportStudent &&
        other.id == id &&
        other.student == student &&
        other.permissionDate == permissionDate &&
        other.permissionMessage == permissionMessage &&
        other.permissionStatus == permissionStatus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        student.hashCode ^
        permissionDate.hashCode ^
        permissionMessage.hashCode ^
        permissionStatus.hashCode;
  }
}
