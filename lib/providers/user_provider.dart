import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<String, String> _userData = {};

  Map<String, String> get userData => _userData;

  void setUserData(Map<String, String> newUserData) {
    _userData = newUserData;
    notifyListeners();
  }
}
