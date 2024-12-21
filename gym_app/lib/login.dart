import 'package:flutter/material.dart';
import 'package:gym_app/auth_service.dart';
import 'package:gym_app/signup.dart';
import 'package:gym_app/calculations.dart';
import 'package:gym_app/text_field.dart';
import 'button.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final auth = AuthService();

  void login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }
    final user = await auth.logInUserWithEmailAndPassword(
        context, _emailController.text, _passwordController.text);
    if (user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User Login successfully!")),
      );
      if (_emailController.text == "aqeel@gmail.com") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Dashboard()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Calculations(uid: user.uid)));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to Login user. Please try again.")),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                  CustomButton(
                    text: "Login",
                    size: Theme.of(context).textTheme.bodyMedium!,
                    onPressed: login
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
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
