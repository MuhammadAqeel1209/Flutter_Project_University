import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';

class WaterIntakeCalculator extends StatefulWidget {
  const WaterIntakeCalculator({super.key});

  @override
  _WaterIntakeCalculatorState createState() => _WaterIntakeCalculatorState();
}

class _WaterIntakeCalculatorState extends State<WaterIntakeCalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController activityController = TextEditingController();
  double? waterIntake;

  void calculateWaterIntake() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double activity = double.tryParse(activityController.text) ?? 0;

    if (weight <= 0 || activity < 0) {
      setState(() {
        waterIntake = null;
      });
      return;
    }

    setState(() {
      waterIntake = weight * 0.033 + activity * 0.35;
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
                  "Water Intake Calculator",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                TextFieldInput(
                  controller: weightController,
                  hintText: "Enter Your Weight(kg)",
                  obscureText: false,
                  prefixIcon: Icons.monitor_weight,
                  fillColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  controller:activityController,
                  hintText: "Enter Your Activity level(hrs/day)",
                  obscureText: false,
                  prefixIcon: Icons.fitness_center,
                  fillColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateWaterIntake,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    "Calculate Water Intake",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20),
                if (waterIntake != null)
                  Text(
                    "Recommended Water Intake: ${waterIntake!.toStringAsFixed(2)} L",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blueAccent),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
