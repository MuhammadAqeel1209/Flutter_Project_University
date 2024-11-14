import 'package:flutter/material.dart';
import 'package:gym_app/appbar.dart';
import 'package:gym_app/home.dart';
import 'package:gym_app/about.dart';
import 'package:gym_app/trainer.dart';
import 'package:gym_app/classes.dart';
import 'package:gym_app/package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
        fontFamily: 'Roboto',
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white70 : Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _isDarkMode ? Colors.black : Colors.blueAccent,
          titleTextStyle:TextStyle(
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentScreen = const Home();

  void _onMenuItemSelected(String? value) {
    setState(() {
      switch (value) {
        case 'Home':
          _currentScreen = const Home();
          break;
        case 'About':
          _currentScreen =  About();
          break;
        case 'Trainer':
          _currentScreen = const TrainersPage();
          break;
        case 'Classes':
          _currentScreen = const ClassesPage();
          break;
        case 'MemberShip' :
          _currentScreen =  const MembershipPage();
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
          menuItems: const ['Home', 'About','Trainer','Classes','MemberShip'],
          onMenuItemSelected: _onMenuItemSelected,
        ),
        body: _currentScreen,
      ),
    );
  }
}
