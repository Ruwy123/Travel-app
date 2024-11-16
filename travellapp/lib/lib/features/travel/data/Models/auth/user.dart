import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final String userid;

  User({required this.name, required this.email, required this.userid});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'userid': userid};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'] as String,
        email: map['email'] as String,
        userid: map['userid'] as String);
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
