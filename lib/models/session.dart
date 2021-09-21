import 'dart:convert';

class SessionYearModel {
  final int id;
  final String sessionStartYear;
  final String sessionEndYear;
  SessionYearModel({
    required this.id,
    required this.sessionStartYear,
    required this.sessionEndYear,
  });

  SessionYearModel copyWith({
    int? id,
    String? sessionStartYear,
    String? sessionEndYear,
  }) {
    return SessionYearModel(
      id: id ?? this.id,
      sessionStartYear: sessionStartYear ?? this.sessionStartYear,
      sessionEndYear: sessionEndYear ?? this.sessionEndYear,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'session_start_year': sessionStartYear,
      'session_end_year': sessionEndYear,
    };
  }

  factory SessionYearModel.fromMap(Map<String, dynamic> map) {
    return SessionYearModel(
      id: map['id'],
      sessionStartYear: map['session_start_year'],
      sessionEndYear: map['session_end_year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionYearModel.fromJson(String source) =>
      SessionYearModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SessionYearModel(id: $id, session_start_year: $sessionStartYear, session_end_year: $sessionEndYear)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SessionYearModel &&
        other.id == id &&
        other.sessionStartYear == sessionStartYear &&
        other.sessionEndYear == sessionEndYear;
  }

  @override
  int get hashCode =>
      id.hashCode ^ sessionStartYear.hashCode ^ sessionEndYear.hashCode;
}
