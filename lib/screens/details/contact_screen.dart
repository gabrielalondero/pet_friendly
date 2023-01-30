import 'package:flutter/material.dart';
import 'package:pet_friendly/screens/details/widgets/custom_divider.dart';
import 'package:pet_friendly/screens/details/widgets/info_item.dart';
import 'package:pet_friendly/screens/details/widgets/subtitle.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(),
        const Subtitle(subtitle: 'Contact'),
        const SizedBox(height: 12),
        InfoItem(
          text: 'petfindertechsupport@gmail.com',
          image: path.emailImage,
          verticalMargin: 3,
        ),
        InfoItem(
          text: '555-555-5555',
          image: path.phoneImage,
          verticalMargin: 3,
        ),
        InfoItem(
          text: 'Jersey City, NJ - US',
          image: path.addressImage,
          verticalMargin: 3,
        ),
      ],
    );
  }
}
