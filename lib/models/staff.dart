import 'dart:convert';

import 'customuser.dart';

class Staff {
  final CustomUser customuser;
  final int id;
  final String profilePic;
  final String gender;
  final String address;
  Staff({
    required this.customuser,
    required this.id,
    required this.profilePic,
    required this.gender,
    required this.address,
  });

  Staff copyWith({
    CustomUser? customuser,
    int? id,
    String? profilePic,
    String? gender,
    String? address,
  }) {
    return Staff(
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

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      customuser: CustomUser.fromMap(map['customuser']),
      id: map['id'],
      profilePic: map['profile_pic'],
      gender: map['gender'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Staff.fromJson(String source) => Staff.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Staff(customuser: $customuser, id: $id, profile_pic: $profilePic, gender: $gender, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Staff &&
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
