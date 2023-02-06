import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/shared/all_colors.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.animal, required this.index});

  final AnimalModel animal;
  final int index;
  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    final bool indexIsEven = index == 0 || index % 2 == 0;
    return box(
      firstWidget:
          indexIsEven ? _containerInfo(indexIsEven) : _containerImage(),
      secondWidget:
          indexIsEven ? _containerImage() : _containerInfo(indexIsEven),
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

  Widget _containerImage() {
    return Hero(
      tag: index,
      child: Container(
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
      ),
    );
  }

  Widget _containerInfo(bool indexIsEven) {
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
                  _itemInfo(
                    image: animal.age.image,
                    title: animal.age.title,
                  ),
                  const SizedBox(height: 8),
                  _itemInfo(
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

  Widget _itemInfo({required String image, required String title}) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color.white),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 17,
                width: 17,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: color.textCardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
