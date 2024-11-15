import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';

class IBWCalculator extends StatefulWidget {
  const IBWCalculator({super.key});

  @override
  _IBWCalculatorState createState() => _IBWCalculatorState();
}

class _IBWCalculatorState extends State<IBWCalculator> {
  final TextEditingController heightController = TextEditingController();
  String gender = 'male';
  double? ibw;

  void calculateIBW() {
    double heightCm = double.tryParse(heightController.text) ?? 0;

    if (heightCm <= 0) {
      setState(() {
        ibw = null;
      });
      return;
    }

    setState(() {
      if (gender == 'male') {
        // Using metric formula for males
        double heightInMeters = heightCm / 100;
        ibw = 22 * (heightInMeters * heightInMeters);
      } else {
        // Using metric formula for females
        double heightInMeters = heightCm / 100;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      child: Text("Male",style: Theme.of(context).textTheme.headlineSmall
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      child:  Text("Female",style: Theme.of(context).textTheme.headlineSmall
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateIBW,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    "Calculate IBW",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blue),
                  ),
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
