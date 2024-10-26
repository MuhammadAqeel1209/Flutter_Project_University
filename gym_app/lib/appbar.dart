import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        // Add padding to the AppBar itself
        toolbarHeight: 80.0,
        title:const Padding(
          padding: EdgeInsets.only(
              top: 16.0),
          child: Text(
            "Fitness App",
            style: TextStyle(fontSize: 24), // Adjust font size if necessary
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          // Toggle Button (Switch) without any action
          const Switch(
            value:
                false, // Change this to true if you want it to be initially toggled on
            onChanged: null, // No action performed on change
          ),
        ],
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.favorite), text: "About"),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48.0);
}
