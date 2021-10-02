import 'staff.dart';

class Classes {
  int id;
  String className;
  Staffs staff;
  Classes({
    required this.id,
    required this.className,
    required this.staff,
  });
  static List<Classes> classFromMap(dynamic source) =>
      List<Classes>.from(source.map((x) => Classes.fromMap(x)));

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      id: map['id'],
      className: map['class_name'],
      staff: Staffs.fromMap(map['staff_id']),
    );
  }
}
