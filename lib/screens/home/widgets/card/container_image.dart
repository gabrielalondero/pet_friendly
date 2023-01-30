import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/shared/all_colors.dart';


class ContainerImage extends StatelessWidget {
  ContainerImage({super.key, required this.animal});

  final AnimalModel animal;
  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 153,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: animal.images.isNotEmpty
                ? NetworkImage(animal.images[0])
                : const NetworkImage(path.defaultNetworkImage),
            fit: BoxFit.cover),
        color: color.grey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}