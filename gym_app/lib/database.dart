import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataBaseService {
  final _database = FirebaseFirestore.instance;

  Future<void> addUser(BuildContext context, String uid,
      Map<String, dynamic> userData) async {
    try {
      await _database.collection('users').doc(uid).set(userData);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User added successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add user. Error: $e')),
      );
    }
  }

  Future<void> registerUser(BuildContext context, String uid,
      Map<String, dynamic> userData) async {
    try {
      await _database.collection("register").doc(uid).set(userData);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Register successfully")));
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Register user. Error: $e')),
      );
    }
  }
}
