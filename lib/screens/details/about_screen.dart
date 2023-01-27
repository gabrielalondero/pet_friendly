import 'package:flutter/material.dart';
import 'package:pet_friendly/screens/details/widgets/custom_divider.dart';
import 'package:pet_friendly/screens/details/widgets/info_item.dart';
import 'package:pet_friendly/screens/details/widgets/info_box.dart';
import 'package:pet_friendly/screens/details/widgets/titles.dart';
import 'package:pet_friendly/screens/details/widgets/subtitle.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Titles(
            name: 'Nebula',
            breed: 'American Shorthair',
            status: 'Adoptable',
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoBox(image: path.ageYoungImage, title: 'Young'),
              InfoBox(image: path.sexGenderImage, title: 'Female'),
              InfoBox(image: path.sizeImage, title: 'Medium'),
            ],
          ),
          CustomDivider(),
          _description(),
          CustomDivider(),
          _characteristics(),
          //const SizedBox(height: 90),
        ],
      ),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Subtitle(subtitle: 'Description'),
        const SizedBox(height: 12),
        const Text(
          'Nebula is a shorthaired, shy cat. She is very affectionate once she warms up to you.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: [
              InfoItem(text: 'Neutered', image: path.neuteredImage),
              InfoItem(text: 'House trained', image: path.houseTrainedImage),
              InfoItem(text: 'Brown / Chocolate', image: path.pelageColorImage),
            ],
          ),
        ),
      ],
    );
  }

  Widget _characteristics() {
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return InfoItem(
                image: path.pawHeartImage,
                text: 'Intelligent',
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
}
