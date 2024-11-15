import 'package:flutter/material.dart';
import 'package:gym_app/signup.dart';
import 'package:gym_app/calculations.dart';
import 'package:gym_app/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


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
                  Text("Welcome back",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _emailController,
                    hintText: "Enter Your Email",
                    obscureText: false,
                    prefixIcon: Icons.mail,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _passwordController,
                    hintText: "Enter Your Password",
                    obscureText: true,
                    prefixIcon: Icons.password,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculations()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 15.0),
                        child: Text("Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.blue))),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => const Signup()));
                      },
                      child: Text(
                        "Don't have an Account? Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
