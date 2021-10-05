import 'dart:convert';

class SessionYearModel {
  int id;
  String sessionStartYear;
  String sessionEndYear;
  SessionYearModel({
    required this.id,
    required this.sessionStartYear,
    required this.sessionEndYear,
  });

  factory SessionYearModel.fromMap(Map<String, dynamic> map) {
    return SessionYearModel(
      id: map['id'],
      sessionStartYear: map['session_start_year'],
      sessionEndYear: map['session_end_year'],
    );
  }

  factory SessionYearModel.fromJson(String source) =>
      SessionYearModel.fromMap(json.decode(source));

  static List<SessionYearModel> sessionFromMap(dynamic source) =>
      List<SessionYearModel>.from(
          source.map((x) => SessionYearModel.fromMap(x)));
}
