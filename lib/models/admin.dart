import 'dart:convert';

import 'package:school_management_app/models/customuser.dart';

class Admin {
  final CustomUser customuser;
  final int id;
  final String profilePic;
  final String gender;
  final String address;
  Admin({
    required this.customuser,
    required this.id,
    required this.profilePic,
    required this.gender,
    required this.address,
  });

  Admin copyWith({
    CustomUser? customuser,
    int? id,
    String? profilePic,
    String? gender,
    String? address,
  }) {
    return Admin(
      customuser: customuser ?? this.customuser,
      id: id ?? this.id,
      profilePic: profilePic ?? this.profilePic,
      gender: gender ?? this.gender,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customuser': customuser.toMap(),
      'id': id,
      'profile_pic': profilePic,
      'gender': gender,
      'address': address,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      customuser: CustomUser.fromMap(map['customuser']),
      id: map['id'],
      profilePic: map['profile_pic'],
      gender: map['gender'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Admin(customuser: $customuser, id: $id, profile_pic: $profilePic, gender: $gender, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Admin &&
        other.customuser == customuser &&
        other.id == id &&
        other.profilePic == profilePic &&
        other.gender == gender &&
        other.address == address;
  }

  @override
  int get hashCode {
    return customuser.hashCode ^
        id.hashCode ^
        profilePic.hashCode ^
        gender.hashCode ^
        address.hashCode;
  }
}
