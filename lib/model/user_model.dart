import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));  
String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? userId; 
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String password;

  Users({
    this.userId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    required this.email,
    required this.password,
  });

 
  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,  
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      };
}
