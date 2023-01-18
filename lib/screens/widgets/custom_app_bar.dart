import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFF8F8F8),
      centerTitle: true,
      elevation: 0,
    );
  }
}
