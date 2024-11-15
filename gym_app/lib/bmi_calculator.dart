import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gym_app/slider.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double weight = 50;
  double height = 130;
  String result = "";

  void calculateBMI() {
    double heightMeter = height / 100;
    var bmi = weight / pow(heightMeter, 2);
    var msg = "";

    if (bmi < 18.5) {
      msg = "You are Underweight";
    } else if (bmi < 25) {
      msg = "You are Healthy";
    } else if (bmi < 30) {
      msg = "You are Overweight";
    } else {
      msg = "You are Obese";
    }

    setState(() {
      result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "BMI Calculator",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),

                SliderInput(
                  percentage: height,
                  symbol: "cm",
                  min: 50,
                  max: 250,
                  division: 200,
                  label: "Height",
                  onChanged: (value) => setState(() => height = value),
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),

                SliderInput(
                  percentage: weight,
                  symbol: 'kg',
                  min: 30,
                  max: 150,
                  division: 120,
                  label: "Weight",
                  onChanged: (value) => setState(() => weight = value),
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:  Text("Calculate BMI", style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20),
                if (result.isNotEmpty)
                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}