import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/registration.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  final PageController _pageController = PageController();
  final List<Map<String, dynamic>> memberships = [
    {
      "title": "Standard",
      "price": "30",
      "benefits": [
        {"icon": FontAwesomeIcons.check, "text": "Include Membership"},
        {"icon": FontAwesomeIcons.check, "text": "Access to all Gym Facilities"},
        {"icon": FontAwesomeIcons.xmark, "text": "Diet Plan Include"},
        {"icon": FontAwesomeIcons.check, "text": "Health and Fitness Tip"},
        {"icon": FontAwesomeIcons.check, "text": "Full Access to Everything"},
        {"icon": FontAwesomeIcons.xmark, "text": "No Additional amenities"},
        {"icon": FontAwesomeIcons.check, "text": "Body Builder Coach"},
        {"icon": FontAwesomeIcons.xmark, "text": "Trainer Classes Teacher"},
        {"icon": FontAwesomeIcons.xmark, "text": "Fitness Coach"},
        {"icon": FontAwesomeIcons.xmark, "text": "Yoga Coach"},
      ],
    },
    {
      "title": "Ultimate",
      "price": "45",
      "benefits": [
        {"icon": FontAwesomeIcons.check, "text": "Include Membership"},
        {"icon": FontAwesomeIcons.check, "text": "Access to all Gym Facilities"},
        {"icon": FontAwesomeIcons.check, "text": "Diet Plan Include"},
        {"icon": FontAwesomeIcons.check, "text": "Health and Fitness Tip"},
        {"icon": FontAwesomeIcons.check, "text": "Full Access to Everything"},
        {"icon": FontAwesomeIcons.xmark, "text": "No Additional amenities"},
        {"icon": FontAwesomeIcons.check, "text": "Body Builder Coach"},
        {"icon": FontAwesomeIcons.xmark, "text": "Trainer Classes Teacher"},
        {"icon": FontAwesomeIcons.check, "text": "Fitness Coach"},
        {"icon": FontAwesomeIcons.xmark, "text": "Yoga Coach"},
      ],
    },
    {
      "title": "Professional",
      "price": "60",
      "benefits": [
        {"icon": FontAwesomeIcons.check, "text": "Include Membership"},
        {"icon": FontAwesomeIcons.check, "text": "Access to all Gym Facilities"},
        {"icon": FontAwesomeIcons.check, "text": "Diet Plan Include"},
        {"icon": FontAwesomeIcons.check, "text": "Health and Fitness Tip"},
        {"icon": FontAwesomeIcons.check, "text": "Full Access to Everything"},
        {"icon": FontAwesomeIcons.check, "text": "No Additional amenities"},
        {"icon": FontAwesomeIcons.check, "text": "Body Builder Coach"},
        {"icon": FontAwesomeIcons.check, "text": "Fitness Coach"},
        {"icon": FontAwesomeIcons.check, "text": "Yoga Coach"},
        {"icon": FontAwesomeIcons.check, "text": "Trainer Classes Teacher"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Membership Card",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: memberships.length,
                onPageChanged: (index) {
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  final membership = memberships[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[800]
                          : Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.redAccent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          membership["title"],
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "\$${membership["price"]}/Month",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: membership["benefits"].length,
                            itemBuilder: (context, benefitIndex) {
                              final benefit = membership["benefits"][benefitIndex];
                              return Row(
                                children: [
                                  Icon(
                                    benefit["icon"],
                                    color: benefit["icon"] == FontAwesomeIcons.check
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    benefit["text"],
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 50),  ),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const RegistrationPage()));
                          },
                          child: Text(
                            "Buy Now",
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
