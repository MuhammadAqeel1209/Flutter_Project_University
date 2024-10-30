import 'package:flutter/material.dart';
import 'package:gym_app/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/03/27/07/08/man-1282232_1280.jpg",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Space between the image and text
            Column(
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Make ',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold, // Optional: Make it bold
                          ),
                        ),
                        TextSpan(
                          text: 'Your Body \n',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Health & Fit\n\n',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Best Gym & Fitness Center\nBuild Your Health & Ultimate Fitness Solution",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange, minimumSize: const Size(130, 60), // text color
                    ),

                    child: Text(
                      "Get Started",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
