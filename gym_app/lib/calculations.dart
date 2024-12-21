import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/bmi_calculator.dart';
import 'package:gym_app/calorierequirementcalculator.dart';
import 'package:gym_app/heatratezone.dart';
import 'package:gym_app/idealbodyweight.dart';
import 'package:gym_app/macronutrient_Breakdown_Calculator.dart';
import 'package:gym_app/water_intake_calculator.dart';

import 'auth_service.dart';
import 'button.dart';

class Calculations extends StatefulWidget {
  final String uid;
  const Calculations({super.key, required this.uid});

  @override
  State<Calculations> createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations> {
  String username = "Loading...";
  final auth = AuthService();
  final database = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      final userDoc =
      await database.collection("users").doc(widget.uid).get();

      if (userDoc.exists) {
        setState(() {
          username = userDoc.data()?["firstName"] ?? "Unknown User";
        });
      } else {
        setState(() {
          username = "User not found";
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching user data: $e")),
      );
    }
  }

  void _logout() {
    auth.signOut(context);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Logged out successfully!")),
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
                  Text("Health Calculator",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome, $username!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: const [
                        BMICalculator(),
                        CalorieRequirementCalculator(),
                        HeartRateZoneCalculator(),
                        IBWCalculator(),
                        MacronutrientCalculator(),
                        WaterIntakeCalculator(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomButton(
                      text: "Log Out",
                      size: Theme.of(context).textTheme.bodyMedium!,
                      onPressed: _logout,
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
