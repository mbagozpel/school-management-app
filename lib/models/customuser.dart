import 'dart:convert';

class CustomUser {
  final int id;
  final String username;
  final String email;
  final String password;
  final String first_name;
  final String last_name;
  CustomUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
  });

  CustomUser copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? first_name,
    String? last_name,
  }) {
    return CustomUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory CustomUser.fromMap(Map<String, dynamic> map) {
    return CustomUser(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      first_name: map['first_name'],
      last_name: map['last_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomUser.fromJson(String source) =>
      CustomUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomUser(id: $id, username: $username, email: $email, password: $password, first_name: $first_name, last_name: $last_name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomUser &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.first_name == first_name &&
        other.last_name == last_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        first_name.hashCode ^
        last_name.hashCode;
  }
}
