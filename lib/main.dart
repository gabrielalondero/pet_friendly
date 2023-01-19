import 'package:flutter/material.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
import 'package:pet_friendly/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());

  PetFinderService repo = PetFinderService();
  repo.request();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Friendly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

