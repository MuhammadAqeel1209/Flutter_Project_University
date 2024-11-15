import 'package:flutter/material.dart';

class SliderInput extends StatelessWidget {
  final String label;
  final double percentage;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int division;
  final String symbol;
  final Color activeColor;
  final Color inactiveColor;

  const SliderInput({
    super.key,
    required this.label,
    required this.percentage,
    this.onChanged,
    required this.min,
    required this.max,
    required this.division,
    required this.symbol,
    this.activeColor = Colors.blueAccent,
    this.inactiveColor = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ${percentage.toStringAsFixed(0)} $symbol",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Slider(
          value: percentage,
          min: min,
          max: max,
          divisions: division,
          label: "${percentage.toStringAsFixed(0)} $symbol",
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }
}
