import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle size;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48.0,
          vertical: 15.0,
        ),
        child: Text(
          text,
          style: size,
        ),
      ),
    );
  }
}
