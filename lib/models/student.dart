import 'dart:convert';
import 'dart:io';

import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';

import 'customuser.dart';

class Student {
  CustomUser customuser;
  final int id;
  File profilePic;
  String gender;
  String address;
  String dob;
  String phoneNo;
  Classes classId;
  SessionYearModel sessionYearId;
  Student(
      {required this.customuser,
      required this.id,
      required this.profilePic,
      required this.gender,
      required this.address,
      required this.classId,
      required this.sessionYearId,
      required this.dob,
      required this.phoneNo});

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      customuser: CustomUser.fromMap(map['customuser']),
      id: map['id'],
      profilePic: map['profilePic'],
      gender: map['gender'],
      dob: map['dob'],
      phoneNo: map['phoneNo'],
      address: map['address'],
      classId: Classes.fromMap(map['class_id']),
      sessionYearId: SessionYearModel.fromMap(map['session_year_id']),
    );
  }
}

class Students {
  CustomUser customuser;
  final int id;
  String profilePic;
  String gender;
  String dob;
  String phoneNo;
  String address;
  Classes classId;
  SessionYearModel sessionYearId;
  Students(
      {required this.customuser,
      required this.id,
      required this.profilePic,
      required this.gender,
      required this.address,
      required this.classId,
      required this.sessionYearId,
      required this.dob,
      required this.phoneNo});

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      customuser: CustomUser.fromMap(map['customuser']),
      id: map['id'],
      profilePic: map['profile_pic'],
      gender: map['gender'],
      phoneNo: map['phone_number'],
      dob: map['dob'],
      address: map['address'],
      classId: Classes.fromMap(map['class_id']),
      sessionYearId: SessionYearModel.fromMap(map['session_year_id']),
    );
  }

  static List<Students> studentFromMap(dynamic source) =>
      List<Students>.from(source.map((x) => Students.fromMap(x)));
}
