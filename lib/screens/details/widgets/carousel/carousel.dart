import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 330,             
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context,index) {
              return Container(
                
                color: index == 1 ?Colors.red[400] : Colors.red[200],
              );
            },
          ),
        ),
        _buildBullets(),
      ],
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color.pinkLight,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color.greyLight,
            ),
          ),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color.greyLight,
            ),
          ),
        ],
      ),
    );
  }
}
