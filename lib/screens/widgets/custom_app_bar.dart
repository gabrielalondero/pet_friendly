import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        //se pode voltar, mostra o botão de voltar
        visible: Navigator.of(context).canPop(),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      title: const Text(
        'PetFriendly',
        style: TextStyle(
          fontSize: 30,
          shadows: [
            Shadow(
              offset: Offset(0, 3),
              blurRadius: 7,
              color: Color.fromARGB(77, 53, 53, 53),
            )
          ],
        ),
      ),
      backgroundColor: color,
      centerTitle: true,
      elevation: 0,
    );
  }
}
