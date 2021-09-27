import 'dart:convert';

class CustomUser {
  final int id;
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  CustomUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  CustomUser copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return CustomUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory CustomUser.fromMap(Map<String, dynamic> map) {
    return CustomUser(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomUser.fromJson(String source) =>
      CustomUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomUser(id: $id, username: $username, email: $email, password: $password, first_name: $firstName, last_name: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomUser &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode;
  }
}
