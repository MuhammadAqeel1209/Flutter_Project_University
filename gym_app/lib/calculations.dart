import 'package:flutter/material.dart';
import 'package:gym_app/bmi_calculator.dart';
import 'package:gym_app/calorierequirementcalculator.dart';
import 'package:gym_app/heatratezone.dart';
import 'package:gym_app/idealbodyweight.dart';
import 'package:gym_app/macronutrient_Breakdown_Calculator.dart';
import 'package:gym_app/water_intake_calculator.dart';

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
                        CalorieRequirementCalculator(),
                        HeartRateZoneCalculator(),
                        IBWCalculator(),
                        MacronutrientCalculator(),
                        WaterIntakeCalculator(),
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

