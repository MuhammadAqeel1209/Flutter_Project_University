import 'package:flutter/material.dart';


class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:
    Scaffold(
      body: Center(
          child: Text("About")
      ),
    ),
    );
  }
}