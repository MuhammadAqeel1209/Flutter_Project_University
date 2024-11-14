import 'package:flutter/material.dart';
import 'package:gym_app/bmi_calculator.dart';

class Calculations extends StatefulWidget {
  const Calculations({super.key});

  @override
  State<Calculations> createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 29),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Health Calculator",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: const [
                        BMICalculator(),
                      ],
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


