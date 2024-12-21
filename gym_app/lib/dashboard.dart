import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/database.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final database = DataBaseService();

  // Delete user function
  void deletedUser(String tableName, String uid) async {
    await database.deleteUser(context, uid, tableName);
  }

  // Update user function for 'users' collection
  void updatedUser(String tableName, String id, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController firstNameController =
        TextEditingController(text: data['firstName']);
        TextEditingController lastNameController =
        TextEditingController(text: data['lastName']);
        TextEditingController emailController =
        TextEditingController(text: data['email']);

        return AlertDialog(
          title: const Text("Edit User"),
          content: SingleChildScrollView( // Make the content scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: "First Name"),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: "Last Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                database.updateUsers(context, tableName, id, {
                  "firstName": firstNameController.text,
                  "lastName": lastNameController.text,
                  "email": emailController.text,
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // Update register function for 'register' collection
  void updatedRegister(String tableName, String id, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController =
        TextEditingController(text: data['name']);
        TextEditingController emailController =
        TextEditingController(text: data['email']);
        TextEditingController genderController =
        TextEditingController(text: data['gender']);
        TextEditingController phoneController =
        TextEditingController(text: data['phone']);

        return AlertDialog(
          title: const Text("Edit Registration"),
          content: SingleChildScrollView( // Make the content scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(labelText: "Gender"),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                database.updateUsers(context, tableName, id, {
                  "name": nameController.text,
                  "email": emailController.text,
                  "gender": genderController.text,
                  "phone": phoneController.text,
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 29),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DashBoard",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 8),
                  Text("User Data",
                      style: Theme.of(context).textTheme.headlineMedium),

                  // Stream for User Data
                  Expanded(
                    child: StreamBuilder(
                      stream: database.getData("users"),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text("No User Found"));
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final userData = snapshot.data!.docs[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: ListTile(
                                title: Text(
                                    '${userData['firstName']} ${userData['lastName'] ?? "No Last Name"}'),
                                subtitle: Text(userData['email'] ?? 'No Email'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () =>
                                          updatedUser('users', userData.id, {
                                            'firstName': userData['firstName'],
                                            'lastName': userData['lastName'],
                                            'email': userData['email'],
                                          }),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () =>
                                          deletedUser('users', userData.id),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text("User Register",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text("Gym Membership",
                      style: Theme.of(context).textTheme.headlineMedium),

                  // Stream for Register Data (showing all columns)
                  Expanded(
                    child: StreamBuilder(
                      stream: database.getData("register"),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                              child: Text("No Registration Found"));
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final userRegister = snapshot.data!.docs[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: ListTile(
                                title: Text(userRegister['name'] ?? 'No Name'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        ' ${userRegister['email'] ?? 'No Email'}'),
                                    Text(
                                        ' ${userRegister['gender'] ?? 'No Gender'}'),
                                    Text(
                                        ' ${userRegister['message'] ?? 'No Message'}'),
                                    Text(
                                        ' ${userRegister['package'] ?? 'No Package'}'),
                                    Text(
                                        ' ${userRegister['phone'] ?? 'No Phone'}'),
                                    Text(
                                        ' ${userRegister['price'] ?? 'No Price'}'),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () => updatedRegister(
                                          'register', userRegister.id, {
                                        'name': userRegister['name'],
                                        'email': userRegister['email'],
                                        'gender': userRegister['gender'],
                                        'message': userRegister['message'],
                                        'package': userRegister['package'],
                                        'phone': userRegister['phone'],
                                        'price': userRegister['price'],
                                      }),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => deletedUser(
                                          'register', userRegister.id),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
