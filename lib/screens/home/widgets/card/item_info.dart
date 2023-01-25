import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class ItemInfo extends StatelessWidget {
  ItemInfo({super.key, required this.image, required this.title});

  final String image;
  final String title;
  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color.white),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 17,
                width: 17,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: color.textCardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
