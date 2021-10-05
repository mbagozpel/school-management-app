import 'package:school_management_app/models/session.dart';

class Term {
  int id;
  String title;
  SessionYearModel session;
  Term({
    required this.id,
    required this.title,
    required this.session,
  });

  factory Term.fromMap(Map<String, dynamic> map) {
    return Term(
      id: map['id'],
      title: map['term'],
      session: SessionYearModel.fromMap(map['session']),
    );
  }

  static List<Term> termFromMap(dynamic source) =>
      List<Term>.from(source.map((x) => Term.fromMap(x)));
}
