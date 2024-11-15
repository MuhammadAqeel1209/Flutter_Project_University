import 'package:flutter/material.dart';
import 'package:gym_app/slider.dart';

class MacronutrientCalculator extends StatefulWidget {
  const MacronutrientCalculator({super.key});

  @override
  _MacronutrientCalculatorState createState() => _MacronutrientCalculatorState();
}

class _MacronutrientCalculatorState extends State<MacronutrientCalculator> {
  final TextEditingController caloriesController = TextEditingController();
  double proteinPercentage = 30.0;
  double fatPercentage = 25.0;
  double carbPercentage = 45.0;

  Map<String, double> breakdown = {
    "Protein": 0,
    "Fats": 0,
    "Carbs": 0,
  };

  void calculateBreakdown() {
    double calories = double.tryParse(caloriesController.text) ?? 0;

    if (calories > 0) {
      setState(() {
        breakdown["Protein"] = calories * proteinPercentage / 100;
        breakdown["Fats"] = calories * fatPercentage / 100;
        breakdown["Carbs"] = calories * carbPercentage / 100;
      });
    }
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
                  "Macronutrient Breakdown Calculator",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                TextField(
                  controller: caloriesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Daily Caloric Requirement:',
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.3),
                    prefixIcon: const Icon(Icons.local_fire_department, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => calculateBreakdown(),
                ),
                const SizedBox(height: 20),
                SliderInput(
                  label: "Protein",
                  symbol: "%",
                  percentage: proteinPercentage,
                  min: 0,
                  max: 100,
                  division: 100,
                  onChanged: (value) {
                    setState(() {
                      proteinPercentage = value;
                      carbPercentage = 100 - proteinPercentage - fatPercentage;
                      calculateBreakdown();
                    });
                  },
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                SliderInput(
                  label: "Fats",
                  symbol: "%",
                  percentage: fatPercentage,
                  min: 0,
                  max: 100,
                  division: 100,
                  onChanged: (value) {
                    setState(() {
                      fatPercentage = value;
                      carbPercentage = 100 - proteinPercentage - fatPercentage;
                      calculateBreakdown();
                    });
                  },
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                SliderInput(
                  label: "Carbs",
                  symbol: "%",
                  percentage: carbPercentage,   min: 0,
                  max: 100,
                  division: 100,
                  onChanged: null,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blueAccent.withOpacity(0.3),
                ),
                const SizedBox(height: 20),
                if (breakdown["Protein"]! > 0)
                  Column(
                    children: [
                      Text(
                        "Protein: ${breakdown["Protein"]!.toStringAsFixed(2)} kcal (${(breakdown["Protein"]! / 4).toStringAsFixed(2)} g)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Fats: ${breakdown["Fats"]!.toStringAsFixed(2)} kcal (${(breakdown["Fats"]! / 9).toStringAsFixed(2)} g)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Carbs: ${breakdown["Carbs"]!.toStringAsFixed(2)} kcal (${(breakdown["Carbs"]! / 4).toStringAsFixed(2)} g)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


