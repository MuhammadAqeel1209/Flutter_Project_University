import 'package:flutter/material.dart';

class TrainersPage extends StatefulWidget {
  const TrainersPage({super.key});

  @override
  State<TrainersPage> createState() => _TrainersPageState();
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Our Trainers",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    // color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 3 : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: screenWidth > 600 ? 3 / 4 : 4 / 5,
                  ),
                  itemCount: trainerData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min, // Prevents overflow
                      children: [
                        Container(
                          height: screenWidth > 600 ? 220 : 180,
                          width: screenWidth > 600 ? 220 : 180,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(trainerData[index]["img"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Flexible(
                          child: Text(
                            trainerData[index]["name"]!,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Flexible(
                          child: Text(
                            trainerData[index]["role"]!,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
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
