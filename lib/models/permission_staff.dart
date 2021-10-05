import 'staff.dart';

class PermissionReportStaff {
  int id;
  Staffs staff;
  String permissionStartDate;
  String permissionEndDate;
  String permissionMessage;
  int permissionStatus;
  PermissionReportStaff({
    required this.id,
    required this.staff,
    required this.permissionStartDate,
    required this.permissionEndDate,
    required this.permissionMessage,
    required this.permissionStatus,
  });

  factory PermissionReportStaff.fromMap(Map<String, dynamic> map) {
    return PermissionReportStaff(
      id: map['id'],
      staff: Staffs.fromMap(map['staff_id']),
      permissionStartDate: map['permission_start_date'],
      permissionEndDate: map['permission_end_date'],
      permissionMessage: map['permission_message'],
      permissionStatus: map['permission_status'],
    );
  }

  static List<PermissionReportStaff> staffPermFromMap(dynamic source) =>
      List<PermissionReportStaff>.from(
          source.map((x) => PermissionReportStaff.fromMap(x)));
}
