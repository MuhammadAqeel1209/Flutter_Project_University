import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  About({super.key});

  final List<Map<String, dynamic>> featured = [
    {
      'icon': FontAwesomeIcons.users,
      'title': 'Award Winning Trainers',
      'subtitle':
          'Our award-winning trainers provide personalized coaching, optimizing every aspect of your fitness journey. Benefit from their expertise and customized workout plans designed for your goals and abilities.',
    },
    {
      'icon': FontAwesomeIcons.personRunning,
      'title': 'Personalized Running Coaching',
      'subtitle':
          "Certified running coaches help you achieve your running goals, whether you're a beginner or seasoned runner. Our experts tailor training plans to suit your needs, ensuring optimal performance and injury prevention.",
    },
    {
      'icon': FontAwesomeIcons.tag,
      'title': 'Excellent Prices',
      'subtitle':
          'Enjoy access to our premium facilities at affordable prices. We believe fitness should be accessible, offering unbeatable value without sacrificing quality or amenities.',
    },
    {
      'icon': FontAwesomeIcons.dumbbell,
      'title': 'Modern Equipment',
      'subtitle':
          'Experience the future of fitness with our advanced equipment, selected to enhance your performance and results. From cardio machines to strength training gear, we provide the latest innovations for top-quality workouts.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // About Us Section
                Center(
                  child: Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                // Featured Section
                Expanded(
                  child: ListView.builder(
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      return FeatureCard(
                        icon: featured[index]['icon'],
                        title: featured[index]['title'],
                        subtitle: featured[index]['subtitle'],
                      );
                    },
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

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(icon, color: Colors.redAccent, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineSmall
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
