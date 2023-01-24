import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
import 'package:pet_friendly/screens/home/home_screen.dart';
import 'package:pet_friendly/stores/home_store.dart';

void main() async {
  setupLocators();
  await initData();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(HomeStore());
}

Future<void> initData() async {
  await GetIt.I<HomeStore>().runRequestGetTypes();
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
      home: HomeScreen(),
    );
  }
}
