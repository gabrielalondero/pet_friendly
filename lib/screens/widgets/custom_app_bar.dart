import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AllColors();
    return AppBar(
      title: const Text(
        'PetFriendly',
        style: TextStyle(
          fontSize: 30,
          shadows: [
            Shadow(
              offset: Offset(0, 3),
              blurRadius: 10,
              color: Color.fromARGB(77, 0, 0, 0),
            )
          ],
        ),
      ),
      backgroundColor: color.backgroundColor,
      centerTitle: true,
      elevation: 0,
    );
  }
}
