import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataBaseService {
  final _database = FirebaseFirestore.instance;

  Future<void> addUser(BuildContext context, String uid,
      Map<String, dynamic> userData) async {
    try {
      await _database.collection('users').doc(uid).set(userData);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('')),
      );
    }
  }

  Future<void> registerUser(BuildContext context, String uid,
      Map<String, dynamic> userData) async {
    try {
      await _database.collection("register").doc(uid).set(userData);
    }

    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Register user. Error: $e')),
      );
    }
  }

  Stream<QuerySnapshot> getData(String tableName){
    return _database.collection(tableName).snapshots();
  }

  Future<void> deleteUser(BuildContext context , String uid, String tableName) async{
    try {
      await _database.collection(tableName).doc(uid).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User deleted successfully!")),
      );
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete User Error: $e")),
      );
    }
    }

    Future<void> updateUsers(BuildContext context, String tableName, String id,Map<String, dynamic> updateUser)
   async {
    try
        {
          await _database.collection(tableName).doc(id).update(updateUser);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User updated successfully!")),
          );
        } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update User. Error: $e")),
      );
        }
    }

}


