import 'package:school_management_app/models/staff.dart';

class Subject {
  int id;
  String subjectName;

  Staffs staffId;
  Subject({
    required this.id,
    required this.subjectName,
    required this.staffId,
  });

  static List<Subject> subjectFromMap(dynamic source) =>
      List<Subject>.from(source.map((x) => Subject.fromMap(x)));

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      subjectName: map['subject_name'],
      staffId: Staffs.fromMap(map['staff_id']),
    );
  }
}
