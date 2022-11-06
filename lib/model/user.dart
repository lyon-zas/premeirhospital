import 'dart:convert';

class User {
  final String uid;
  final String name;
  final String email;
  // final String role;
  // final String Phone;

  User(
    // this.role,
    // this.Phone, 
    {
    required this.uid,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': name,
      'email': email,
      
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      // role: map["role"] ?? '',
      // phone: map["role"] ?? '',
    );
  }
}
