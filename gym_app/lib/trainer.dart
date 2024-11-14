import 'package:flutter/material.dart';

class TrainersPage extends StatefulWidget {
  const TrainersPage({super.key});

  @override
  State <TrainersPage> createState() => _TrainersPageState();
}

class _TrainersPageState extends State<TrainersPage> {

  final List<Map<String, String>> trainerData = [
    {
      "img": "assets/img/trainers/david.jpg",
      "name": "David Williams",
      "role": "Body Builder Coach",
    },
    {
      "img": "assets/img/trainers/matt.jpg",
      "name": "Matt Stone",
      "role": "Trainer Teacher",
    },
    {
      "img": "assets/img/trainers/rosy.jpg",
      "name": "Rivera Fitness",
      "role": "Fitness Coach",
    },
    {
      "img": "assets/img/trainers/sofia.jpg",
      "name": "Dylan Werner",
      "role": "Yoga Coach",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Our Trainers",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: trainerData.length,
                    itemBuilder: (context, index) {
                      final item = trainerData[index];
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(item["img"]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item["name"]!,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item["role"]!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
