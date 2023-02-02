import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/screens/details/widgets/custom_divider.dart';
import 'package:pet_friendly/screens/details/widgets/info_item.dart';
import 'package:pet_friendly/screens/details/widgets/info_box.dart';
import 'package:pet_friendly/screens/details/widgets/subtitle.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;

class About extends StatelessWidget {
  const About({super.key, required this.animal});

  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoBox(
              image: animal.age.image,
              title: animal.age.title,
            ),
            InfoBox(
              image: path.sexGenderImage,
              title: animal.gender,
            ),
            InfoBox(
              image: path.sizeImage,
              title: animal.size,
            ),
          ],
        ),
        CustomDivider(),
        _description(),
        CustomDivider(),
        _characteristics(),
      ],
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Subtitle(subtitle: 'Description'),
        const SizedBox(height: 13),
        if (animal.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              animal.description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runSpacing: 10,
          children: [
            InfoItem(
              text: animal.spayedNeutered ? 'Neutered' : 'Not neutered',
              image: path.neuteredImage,
            ),
            if (animal.houseTrained)
              InfoItem(text: 'House trained', image: path.houseTrainedImage),
            InfoItem(text: animal.colors, image: path.pelageColorImage),
          ],
        ),
      ],
    );
  }

  Widget _characteristics() {
    if (animal.tags.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Subtitle(subtitle: 'Other characteristics'),
          const SizedBox(height: 15),
          SizedBox(
            height: 32,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: animal.tags.length,
              itemBuilder: (context, index) {
                return InfoItem(
                  image: path.pawHeartImage,
                  text: animal.tags[index],
                  withBackground: true,
                  horizontalMargin: 2.5,
                  horizontalPadding: 5,
                );
              },
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
