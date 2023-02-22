import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  static Future loginUser(BuildContext context,String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      
    }
  }
}
