import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/stores/details_store.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.color});

  final Color color;
  final DetailsStore detailsStore = GetIt.I<DetailsStore>();

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
            detailsStore.resetDetails();
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
