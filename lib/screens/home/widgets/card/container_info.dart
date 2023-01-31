import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/screens/home/widgets/card/item_info.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/shared/all_colors.dart';

class ContainerInfo extends StatelessWidget {
  ContainerInfo({super.key, required this.animal, required this.indexIsEven});

  final AnimalModel animal;
  final bool indexIsEven;
  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 160,
      decoration: BoxDecoration(
        color: color.pinkLight,
        borderRadius: BorderRadius.only(
          topLeft: _borderRadius(indexIsEven, false),
          bottomLeft: _borderRadius(indexIsEven, false),
          topRight: _borderRadius(indexIsEven, true),
          bottomRight: _borderRadius(indexIsEven, true),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              animal.breeds,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color.textCardColor,
              ),
            ),
            const SizedBox(height: 7),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemInfo(
                    image: animal.age.image,
                    title: animal.age.title,
                  ),
                  const SizedBox(height: 8),
                  ItemInfo(
                    image: path.sexGenderImage,
                    title: animal.gender,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Radius _borderRadius(bool isEven, bool isRight) {
    return isEven && isRight || !isEven && !isRight
        ? const Radius.circular(0)
        : const Radius.circular(6);
  }
}
