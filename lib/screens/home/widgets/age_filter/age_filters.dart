import 'package:flutter/material.dart';
import 'package:pet_friendly/models/age_model.dart' as age;
import 'package:pet_friendly/screens/home/widgets/age_filter/age_filter_box.dart';

class AgeFilters extends StatelessWidget {
  const AgeFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [         
          AgeFilterBox(
            age: age.baby,
          ),
          AgeFilterBox(
            age: age.young,
          ),
          AgeFilterBox(
            age: age.adult,
          ),
          AgeFilterBox(
            age: age.senior,
          ),
        ],
      ),
    );
  }
}
