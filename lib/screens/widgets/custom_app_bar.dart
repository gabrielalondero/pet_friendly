import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/colors.dart' as color;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
