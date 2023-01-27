import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({super.key});

  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: color.pinkLight),
    );
  }
}