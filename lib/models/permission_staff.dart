import 'dart:convert';

import 'staff.dart';

class PermissionReportStaff {
  final int id;
  final Staff staff;
  final String permissionDate;
  final String permissionMessage;
  final int permissionStatus;
  PermissionReportStaff({
    required this.id,
    required this.staff,
    required this.permissionDate,
    required this.permissionMessage,
    required this.permissionStatus,
  });

  PermissionReportStaff copyWith({
    int? id,
    Staff? staff,
    String? permissionDate,
    String? permissionMessage,
    int? permissionStatus,
  }) {
    return PermissionReportStaff(
      id: id ?? this.id,
      staff: staff ?? this.staff,
      permissionDate: permissionDate ?? this.permissionDate,
      permissionMessage: permissionMessage ?? this.permissionMessage,
      permissionStatus: permissionStatus ?? this.permissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'staff_id': staff.toMap(),
      'permission_date': permissionDate,
      'permission_message': permissionMessage,
      'permission_status': permissionStatus,
    };
  }

  factory PermissionReportStaff.fromMap(Map<String, dynamic> map) {
    return PermissionReportStaff(
      id: map['id'],
      staff: Staff.fromMap(map['staff_id']),
      permissionDate: map['permission_date'],
      permissionMessage: map['permission_message'],
      permissionStatus: map['permission_status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionReportStaff.fromJson(String source) =>
      PermissionReportStaff.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PermissionReportStaff(id: $id, staff_id: $staff, permission_date: $permissionDate, permission_message: $permissionMessage, permission_status: $permissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PermissionReportStaff &&
        other.id == id &&
        other.staff == staff &&
        other.permissionDate == permissionDate &&
        other.permissionMessage == permissionMessage &&
        other.permissionStatus == permissionStatus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        staff.hashCode ^
        permissionDate.hashCode ^
        permissionMessage.hashCode ^
        permissionStatus.hashCode;
  }
}
