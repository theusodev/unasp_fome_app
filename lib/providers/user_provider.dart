import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic> _userData = {};

  Map<String, dynamic> get userData => _userData;

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get();
      _userData = userDoc.data() as Map<String, dynamic>;
      notifyListeners();
    }
  }

  void setUserData(Map<String, dynamic> userData) {
    _userData = userData;
    notifyListeners();
  }
}
