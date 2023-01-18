import 'package:flutter/material.dart';
import 'package:pet_friendly/screens/home/widgets/age_filter/age_filters.dart';
import 'package:pet_friendly/screens/home/widgets/custom_text_field.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomTextField(),
              SizedBox(height: 22),
              AgeFilters(),
              SizedBox(height: 22),              
            ],
          )),
    );
  }
}
