import 'dart:convert';

import 'staff.dart';

class Classes {
  final int id;
  final String className;
  final Staff staff;
  Classes({
    required this.id,
    required this.className,
    required this.staff,
  });

  Classes copyWith({
    int? id,
    String? className,
    Staff? staff,
  }) {
    return Classes(
      id: id ?? this.id,
      className: className ?? this.className,
      staff: staff ?? this.staff,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'class_name': className,
      'staff': staff.toMap(),
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      id: map['id'],
      className: map['class_name'],
      staff: Staff.fromMap(map['staff']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));

  @override
  String toString() =>
      'Classes(id: $id, class_name: $className, staff: $staff)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Classes &&
        other.id == id &&
        other.className == className &&
        other.staff == staff;
  }

  @override
  int get hashCode => id.hashCode ^ className.hashCode ^ staff.hashCode;
}
