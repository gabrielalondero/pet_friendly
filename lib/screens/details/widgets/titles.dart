import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class Titles extends StatelessWidget {
  Titles({super.key, required this.name, required this.breed, required this.status});

  final String name;
  final String breed;
  final String status;

  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                  name,
                  style: TextStyle(
                      color: color.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              
            ),
            Text(
              status,
              style: TextStyle(
                  color: color.pink, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          breed,
          style: TextStyle(
            color: color.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
