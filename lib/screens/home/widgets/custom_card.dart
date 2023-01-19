import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/colors.dart' as color;

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 162,       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 128,
              width: 160,
              decoration: BoxDecoration(
                color: color.pinkLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
            ),
            Container(
              height: 162,
              width: 153,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ));
  }
}
