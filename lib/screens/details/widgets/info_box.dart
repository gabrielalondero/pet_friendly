import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class InfoBox extends StatelessWidget {
  InfoBox({super.key, required this.image, required this.title});

  final String image;
  final String title;

  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 84,
      margin: const EdgeInsets.only(right: 7, left: 7),
      decoration: BoxDecoration(
        color: color.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: color.pinkLight)
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 8),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 40,
              width: 47,
            ),
            Expanded(
                child: Center(
              child: Text(
                title,
                style: TextStyle(color: color.textColor, fontSize: 12),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
