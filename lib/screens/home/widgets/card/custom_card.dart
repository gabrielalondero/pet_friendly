import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/screens/home/widgets/card/container_image.dart';
import 'package:pet_friendly/screens/home/widgets/card/container_info.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.animal, required this.index});

  final AnimalModel animal;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool indexIsEven = index == 0 || index % 2 == 0;
    if (indexIsEven) {
      return box(
        firstWidget: ContainerInfo(animal: animal, indexIsEven: indexIsEven),
        secondWidget: ContainerImage(animal: animal),
      );
    }
    return box(
      firstWidget: ContainerImage(animal: animal,),
      secondWidget: ContainerInfo(animal: animal, indexIsEven: indexIsEven),
    );
  }

  
  Widget box({required Widget firstWidget, required Widget secondWidget}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 162,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            firstWidget,
            secondWidget,
          ],
        ),
      ),
    );
  }

}
