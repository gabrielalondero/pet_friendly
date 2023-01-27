import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class InfoItem extends StatelessWidget {
  InfoItem({
    super.key,
    required this.text,
    required this.image,
    this.withBackground = false,
    this.horizontalMargin = 8,
    this.verticalMargin = 0,
    this.horizontalPadding = 0,  
  });

  final String text;
  final String image;
  final bool withBackground;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: withBackground ? color.white : Colors.transparent,
      ),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
