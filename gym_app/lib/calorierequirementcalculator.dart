import 'package:flutter/material.dart';
import 'package:gym_app/slider.dart';

class CalorieRequirementCalculator extends StatefulWidget {
  const CalorieRequirementCalculator({super.key});

  @override
  _CalorieRequirementCalculatorState createState() =>
      _CalorieRequirementCalculatorState();
}

class _CalorieRequirementCalculatorState
    extends State<CalorieRequirementCalculator> {
  double weight = 60; // Default weight
  double height = 170; // Default height
  double age = 25; // Default age
  double? calorieRequirement;

  void calculateCalories(String gender, double activityFactor) {
    double bmr;
    if (gender == 'male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    setState(() {
      calorieRequirement = bmr * activityFactor;
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
                  textAlign: TextAlign.center,
                  "Calorie Requirement Calculator",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),

                // Height Slider
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
                const SizedBox(height: 10),

                SliderInput(
                  percentage: age,
                  symbol: "cm",
                  min: 20,
                  max: 80,
                  division: 10,
                  label: "Age",
                  onChanged: (value) => setState(() => age = value),
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                const SizedBox(height: 10),

                // Weight Slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weight (kg):',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      weight.toStringAsFixed(0),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Slider(
                  value: weight,
                  min: 30,
                  max: 150,
                  divisions: 120,
                  label: weight.toStringAsFixed(0),
                  onChanged: (value) => setState(() => weight = value),
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                const SizedBox(height: 20),

                // Male Button
                ElevatedButton(
                  onPressed: () => calculateCalories('male', 1.55),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Male - Moderate",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 12),

                // Female Button
                ElevatedButton(
                  onPressed: () => calculateCalories('female', 1.55),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Female - Moderate",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 12),

                // Display Calorie Requirement
                if (calorieRequirement != null)
                  Text(
                    "Calorie Requirement: ${calorieRequirement!.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.blue
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
