// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  static Future loginUser(
      BuildContext context, String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static Future logout(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully signed out')));
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
