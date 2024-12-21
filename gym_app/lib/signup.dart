import 'package:flutter/material.dart';
import 'package:gym_app/auth_service.dart';
import 'package:gym_app/database.dart';
import 'package:gym_app/text_field.dart';
import 'button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupSate();
}

class _SignupSate extends State<Signup> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final auth = AuthService();
  final dataBase = DataBaseService();

  void signUp() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    // Create user with email and password
    final user = await auth.createUserWithEmailAndPassword(
      context,
      _emailController.text,
      _passwordController.text,
    );

    if (user != null) {
      // Prepare user data
      final userData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
      };

      // Add user to the database
      dataBase.addUser(context, user.uid, userData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User created successfully!")),
      );
      Navigator.pop(context); // Navigate back to the previous screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Failed to create user. Please try again.")),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New User Registration",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _firstNameController,
                    hintText: "Enter Your First Name",
                    obscureText: false,
                    prefixIcon: Icons.person,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _lastNameController,
                    hintText: "Enter Your Last Name",
                    obscureText: false,
                    prefixIcon: Icons.person,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _emailController,
                    hintText: "Enter Your Email",
                    obscureText: false,
                    prefixIcon: Icons.mail,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _passwordController,
                    hintText: "Enter Your Password",
                    obscureText: true,
                    prefixIcon: Icons.password,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                      text: "Sign Up",
                      size: Theme.of(context).textTheme.bodyMedium!,
                      onPressed: signUp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
