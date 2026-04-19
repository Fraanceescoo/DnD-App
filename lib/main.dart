// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';    // Import HomeScreen
import 'screens/details_screen.dart'; // Import DetailsScreen
import 'screens/profile_screen.dart'; // Import ProfileScreen

void main() => runApp(const MyApp()); // Add const for MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spell List',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),    
        '/details': (context) => DetailsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}