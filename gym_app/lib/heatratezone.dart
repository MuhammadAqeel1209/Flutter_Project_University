import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';

import 'button.dart';
class HeartRateZoneCalculator extends StatefulWidget {
  const HeartRateZoneCalculator({super.key});

  @override
  _HeartRateZoneCalculatorState createState() =>
      _HeartRateZoneCalculatorState();
}

class _HeartRateZoneCalculatorState extends State<HeartRateZoneCalculator> {
  final TextEditingController ageController = TextEditingController();
  double? mhr;
  double? warmUpMin, warmUpMax;
  double? fatBurnMin, fatBurnMax;
  double? cardioMin, cardioMax;
  double? highIntensityMin, highIntensityMax;

  void calculateHeartRateZones() {
    double age = double.tryParse(ageController.text) ?? 0;

    if (age <= 0) {
      setState(() {
        mhr = null;
        warmUpMin = null;
        warmUpMax = null;
        fatBurnMin = null;
        fatBurnMax = null;
        cardioMin = null;
        cardioMax = null;
        highIntensityMin = null;
        highIntensityMax = null;
      });
      return;
    }

    setState(() {
      mhr = (220 - age) as double? ;
      warmUpMin = mhr! * 0.50;
      warmUpMax = mhr! * 0.60;
      fatBurnMin = mhr! * 0.60;
      fatBurnMax = mhr! * 0.70;
      cardioMin = mhr! * 0.70;
      cardioMax = mhr! * 0.80;
      highIntensityMin = mhr! * 0.80;
      highIntensityMax = mhr! * 0.90;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Heart Rate Zone Calculator",
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
                  controller: ageController,
                  hintText: "Enter Your age",
                  obscureText: false,
                  prefixIcon: Icons.calendar_today,
                  fillColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Calculate Heart Rate",
                    size: Theme.of(context).textTheme.headlineSmall!,
                    onPressed: calculateHeartRateZones
                ),
                const SizedBox(height: 20),
                if (mhr != null)
                  Column(
                    children: [
                      Text(
                        "Max Heart Rate: ${mhr!.toStringAsFixed(0)} bpm",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme.headlineSmall
                            ?.copyWith(color: Colors.blueAccent),
                      ),
                      Text(
                        "Warm-up Zone: ${warmUpMin!.toStringAsFixed(0)} - ${warmUpMax!.toStringAsFixed(0)} bpm",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme.headlineSmall
                            ?.copyWith(color: Colors.blueAccent),
                      ),
                      Text(
                        "Fat Burn Zone: ${fatBurnMin!.toStringAsFixed(0)} - ${fatBurnMax!.toStringAsFixed(0)} bpm",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme.headlineSmall
                            ?.copyWith(color: Colors.blueAccent),
                      ),
                      Text(
                        "Cardio Zone: ${cardioMin!.toStringAsFixed(0)} - ${cardioMax!.toStringAsFixed(0)} bpm",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme.headlineSmall
                            ?.copyWith(color: Colors.blueAccent),
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
