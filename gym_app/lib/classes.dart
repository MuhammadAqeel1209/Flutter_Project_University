import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
 State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  final List<Map<String, String>> classes = [
    {
      "name": "Body Building",
      "img": "assets/img/classes/bodybuilding.jpg",
      "text": "Sculpt your physique and build strength with our Body Building class. Designed to target specific muscle groups through resistance training and weightlifting, this class is perfect for individuals looking to increase muscle mass and definition.",
    },
    {
      "name": "Cardio",
      "img": "assets/img/classes/cardio.jpg",
      "text": "Get your heart pumping and burn calories with our Cardio class. Featuring high-energy workouts such as running, cycling, and aerobic exercises, this class is ideal for improving cardiovascular health, endurance, and overall fitness levels.",
    },
    {
      "name": "Cross Fit",
      "img": "assets/img/classes/crossfit.jpg",
      "text": "Experience the ultimate fitness challenge with our CrossFit class. Combining elements of strength training, high-intensity interval training (HIIT), and functional movements, CrossFit offers a dynamic and varied workout that will push your limits and yield impressive results.",
    },
    {
      "name": "Fitness",
      "img": "assets/img/classes/fitness.jpg",
      "text": "Elevate your fitness routine with our Fitness class. Tailored to accommodate all fitness levels, this class focuses on full-body workouts, core strengthening exercises, and flexibility training to improve overall health and well-being. Whether you're a beginner or seasoned athlete, our Fitness class will help you achieve your fitness goals.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Classes",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add space between heading and grid

              // GridView for classes
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final item = classes[index];
                    return Stack(
                      children: [
                        // Background Image
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item["img"]!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // Overlay
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item["name"]!,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 24,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item["text"]!,
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
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
