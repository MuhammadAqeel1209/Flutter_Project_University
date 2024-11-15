import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';

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
                    controller:_passwordController,
                    hintText: "Enter Your Password",
                    obscureText: true,
                    prefixIcon: Icons.password,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 15.0),
                        child: Text("Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.blue))),
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
