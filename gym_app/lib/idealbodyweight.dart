import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';
import 'button.dart';

class IBWCalculator extends StatefulWidget {
  const IBWCalculator({super.key});

  @override
  _IBWCalculatorState createState() => _IBWCalculatorState();
}

class _IBWCalculatorState extends State<IBWCalculator> {
  final TextEditingController heightController = TextEditingController();
  String? gender;
  double? ibw;

  void calculateIBW() {
    double heightCm = double.tryParse(heightController.text) ?? 0;

    // Check if gender is selected
    if (gender == null || gender!.isEmpty) {
      setState(() {
        ibw = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a gender.')),
      );
      return;
    }

    // Check if height is valid
    if (heightCm <= 0) {
      setState(() {
        ibw = null;
      });
      return;
    }

    // Perform IBW calculation
    setState(() {
      double heightInMeters = heightCm / 100;
      if (gender == 'Male') {
        ibw = 22 * (heightInMeters * heightInMeters);
      } else {
        ibw = 21 * (heightInMeters * heightInMeters);
      }
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
                  "Ideal Body Weight Calculator",
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
                  controller: heightController,
                  hintText: "Enter Your Height (cm)",
                  obscureText: false,
                  prefixIcon: Icons.height,
                  fillColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                DropdownInput(
                  value: gender,
                  prefixIcon: Icons.person,
                  hintText: 'Select Gender',
                  items: const ['Male', 'Female'],
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  validator: (value) =>
                  value == null ? 'Please select a gender' : null,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Calculate IBW",
                  size: Theme.of(context).textTheme.headlineSmall!,
                  onPressed: calculateIBW,
                ),
                const SizedBox(height: 20),
                if (ibw != null)
                  Text(
                    "Ideal Body Weight: ${ibw!.toStringAsFixed(2)} kg",
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
