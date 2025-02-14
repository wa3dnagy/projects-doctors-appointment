import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? firstName;
  String? lastName;
  String? email;


  void setUserData(String fName, String lName, String userEmail) {
    firstName = fName;
    lastName = lName;
    email = userEmail;
    notifyListeners(); 
  }

  Map<String, String?> getUserData() {
    return {'firstName': firstName, 'lastName': lastName, 'email': email};
  }
}
