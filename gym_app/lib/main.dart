import 'package:flutter/material.dart';
import 'package:gym_app/appbar.dart';
import 'package:gym_app/home.dart';
import 'package:gym_app/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        fontFamily: "AbrilFatface", // Set the font family here
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 26.0,
            color: _isDarkMode ? Colors.white70 : Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: _isDarkMode ? Colors.white60 : Colors.black54,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _isDarkMode ? Colors.black : Colors.blueAccent,
          titleTextStyle: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      home: MyHomePage(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const MyHomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentScreen = const Home(); // Default screen

  void _onMenuItemSelected(String? value) {
    setState(() {
      if (value == 'Home') {
        _currentScreen = const Home();
      } else if (value == 'About') {
        _currentScreen = const About();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          isDarkMode: widget.isDarkMode,
          toggleTheme: widget.toggleTheme,
          menuItems: const ['Home', 'About'],
          onMenuItemSelected: _onMenuItemSelected,
        ),
        body: _currentScreen,
      ),
    );
  }
}
