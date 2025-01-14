import 'package:flutter/material.dart';
import 'package:gym_app/slider.dart';
import 'package:gym_app/text_field.dart';
import 'button.dart';

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
  final TextEditingController ageController = TextEditingController();
  double? calorieRequirement;

  /// Calculate Calorie Requirement Based on Gender and Activity Factor
  void calculateCalories(String gender, double activityFactor) {
    final ageText = ageController.text;

    // Validate age input
    if (ageText.isEmpty || double.tryParse(ageText) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid age")),
      );
      return;
    }

    double age = double.parse(ageText);

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Calorie Requirement Calculator",
                  textAlign: TextAlign.center,
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

                // Age Input
                TextFieldInput(
                  controller: ageController,
                  hintText: "Enter Your Age",
                  obscureText: false,
                  prefixIcon: Icons.calendar_today,
                  fillColor: Colors.black,
                  keyboardType: TextInputType.number,
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
                CustomButton(
                  text: "Male - Moderate",
                  size: Theme.of(context).textTheme.headlineSmall!,
                  onPressed: () => calculateCalories('male', 1.55),
                ),
                const SizedBox(height: 12),

                // Female Button
                CustomButton(
                  text: "Female - Moderate",
                  size: Theme.of(context).textTheme.headlineSmall!,
                  onPressed: () => calculateCalories('female', 1.55),
                ),

                const SizedBox(height: 12),

                // Display Calorie Requirement
                if (calorieRequirement != null)
                  Text(
                    "Calorie Requirement: ${calorieRequirement!.toStringAsFixed(2)}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.blue),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
