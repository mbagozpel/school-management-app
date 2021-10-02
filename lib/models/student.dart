// import 'dart:convert';

// import 'package:school_management_app/models/classes.dart';
// import 'package:school_management_app/models/session.dart';

// import 'customuser.dart';

// class Student {
//   final CustomUser customuser;
//   final int id;
//   final String profilePic;
//   final String gender;
//   final String address;
//   final Classes classId;
//   final SessionYearModel sessionYearId;
//   Student({
//     required this.customuser,
//     // required this.id,
//     required this.profilePic,
//     required this.gender,
//     required this.address,
//     required this.classId,
//     required this.sessionYearId,
//   });

//   Student copyWith({
//     CustomUser? customuser,
//     int? id,
//     String? profilePic,
//     String? gender,
//     String? address,
//     Classes? classId,
//     SessionYearModel? sessionYearId,
//   }) {
//     return Student(
//       customuser: customuser ?? this.customuser,
//       id: id ?? this.id,
//       profilePic: profilePic ?? this.profilePic,
//       gender: gender ?? this.gender,
//       address: address ?? this.address,
//       classId: classId ?? this.classId,
//       sessionYearId: sessionYearId ?? this.sessionYearId,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'customuser': customuser.toMap(),
//       'id': id,
//       'profile_pic': profilePic,
//       'gender': gender,
//       'address': address,
//       'class_id': classId.toMap(),
//       'session_year_id': sessionYearId.toMap(),
//     };
//   }

//   factory Student.fromMap(Map<String, dynamic> map) {
//     return Student(
//       customuser: CustomUser.fromMap(map['customuser']),
//       id: map['id'],
//       profilePic: map['profilePic'],
//       gender: map['gender'],
//       address: map['address'],
//       classId: Classes.fromMap(map['class_id']),
//       sessionYearId: SessionYearModel.fromMap(map['session_year_id']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Student.fromJson(String source) =>
//       Student.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Student(customuser: $customuser, id: $id, profile_pic: $profilePic, gender: $gender, address: $address, class_id: $classId, session_year_id: $sessionYearId)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Student &&
//         other.customuser == customuser &&
//         other.id == id &&
//         other.profilePic == profilePic &&
//         other.gender == gender &&
//         other.address == address &&
//         other.classId == classId &&
//         other.sessionYearId == sessionYearId;
//   }

//   @override
//   int get hashCode {
//     return customuser.hashCode ^
//         id.hashCode ^
//         profilePic.hashCode ^
//         gender.hashCode ^
//         address.hashCode ^
//         classId.hashCode ^
//         sessionYearId.hashCode;
//   }
// }
