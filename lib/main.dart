import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
import 'package:pet_friendly/screens/home/home_screen.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/details_store.dart';
import 'package:pet_friendly/stores/home_store.dart';

void main() async {
  setupLocators();
  await initData();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(DetailsStore());
  GetIt.I.registerSingleton(HomeStore());
}

Future<void> initData() async {
  await PetFinderService().setToken();
  await GetIt.I<HomeStore>().getTypes();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AllColors();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color.backgroundColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

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
