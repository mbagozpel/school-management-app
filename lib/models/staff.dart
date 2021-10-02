import 'dart:convert';
import 'dart:io';

import 'customuser.dart';

// class for registering staff, I used file(profilePic) to other
// to be able to send as multipartfile
class Staff {
  CustomUser customuser;
  int id;
  File profilePic;
  String phoneNo;
  String dob;
  String gender;
  String address;

  Staff(
      {required this.customuser,
      required this.id,
      required this.profilePic,
      required this.gender,
      required this.address,
      required this.phoneNo,
      required this.dob});
}

//class for receiving staff objects from backend
// backend returns imagepath as string
class Staffs {
  CustomUser customuser;
  int id = 0;
  String phoneNo;
  String dob;
  String profilePic;
  String gender;
  String address;

  Staffs({
    required this.customuser,
    required this.id,
    required this.profilePic,
    required this.gender,
    required this.address,
    required this.dob,
    required this.phoneNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'customuser': customuser.toMap(),
      'id': id,
      'profile_pic': profilePic,
      'gender': gender,
      'address': address,
      'dob': dob,
      'phone_number': phoneNo
    };
  }

  factory Staffs.fromMap(Map<dynamic, dynamic> map) {
    return Staffs(
      customuser: CustomUser.fromMap(map['customuser']),
      id: map['id'],
      profilePic: map['profile_pic'],
      gender: map['gender'],
      dob: map['dob'],
      phoneNo: map['phone_number'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Staffs.fromJson(dynamic source) =>
      Staffs.fromMap(json.decode(source));

  static List<Staffs> staffFromJson(dynamic source) =>
      // Staff.staffFromJson(source);
      List<Staffs>.from(json.decode(source).map((x) => Staffs.fromMap(x)));

  static List<Staffs> staffFromMap(dynamic source) =>
      // Staff.staffFromJson(source);
      List<Staffs>.from(source.map((x) => Staffs.fromMap(x)));
}
