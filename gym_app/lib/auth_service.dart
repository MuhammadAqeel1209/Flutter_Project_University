import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  bool _isAlphanumeric(String password) {
    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).+$');
    return passwordRegex.hasMatch(password);
  }

  /// Create a new user with email and password
  Future<User?> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    // Check if password is alphanumeric
    if (!_isAlphanumeric(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be alphanumeric.')),
      );
      return null;
    }

    try {
      final userCreate = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCreate.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The email is already in use.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('')),
      );
    }
    return null;
  }

  Future<User?> logInUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      final userLogin = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userLogin.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found with this email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect password.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('')),
      );
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User signed out successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign out failed. Please try again. Error: ')),
      );
    }
  }
}
