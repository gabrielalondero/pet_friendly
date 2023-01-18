import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/screens/home/widgets/card/item_info.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  //final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 162,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 128,
            width: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC9C9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 12, left: 12, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'American Shorthair',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5C5050),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ItemInfo(
                          image: 'images/ageFilter/youngAgeFilter.png',  //animal.age.image,
                          title: 'Young',  //animal.age.title,
                        ),
                        const SizedBox(height: 8),
                        ItemInfo(
                          image: path.sexGenderImage,
                          title: 'Female',  //animal.gender,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 162,
            width: 153,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
