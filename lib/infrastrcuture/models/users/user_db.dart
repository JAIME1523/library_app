// To parse this JSON data, do
//
//     final userDb = userDbFromJson(jsonString);

import 'dart:convert';

UserDb userDbFromJson(String str) => UserDb.fromJson(json.decode(str));

String userDbToJson(UserDb data) => json.encode(data.toJson());

class UserDb {
  final String name;
  final String birthdate;
  final String email;
  final String gender;
  final String lastName;
  final int age;
  final String phoneNumber;

  UserDb({
    required this.name,
    required this.birthdate,
    required this.email,
    required this.gender,
    required this.lastName,
    required this.age,
    required this.phoneNumber,
  });

  UserDb copyWith({
    String? name,
    String? birthdate,
    String? email,
    String? gender,
    String? lastName,
    int? age,
    String? phoneNumber

  }) =>
      UserDb(
        name: name ?? this.name,
        birthdate: birthdate ?? this.birthdate,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
        phoneNumber: phoneNumber ?? this.phoneNumber
      );

  factory UserDb.fromJson(Map<String, dynamic> json) => UserDb(
        name: json["name"],
        birthdate: json["birthdate"],
        email: json["email"],
        gender: json["gender"],
        lastName: json["lastName"],
        age: json["age"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthdate": birthdate,
        "email": email,
        "gender": gender,
        "lastName": lastName,
        "age": age,
        "phoneNumber":phoneNumber
      };
}
