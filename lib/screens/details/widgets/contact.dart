import 'package:flutter/material.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/contact_model.dart';
import 'package:pet_friendly/screens/details/widgets/custom_divider.dart';
import 'package:pet_friendly/screens/details/widgets/info_item.dart';
import 'package:pet_friendly/screens/details/widgets/subtitle.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;

class Contact extends StatelessWidget {
  const Contact({super.key, required this.animal});

  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    ContactModel? contact = animal.contact;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDivider(),
        const Subtitle(subtitle: 'Contact'),
        const SizedBox(height: 12),
        InfoItem(
          text: contact.email,
          image: path.emailImage,
          verticalMargin: 3,
        ),
        InfoItem(
          text: contact.phone,
          image: path.phoneImage,
          verticalMargin: 3,
        ),
        InfoItem(
          text: '${contact.city}, ${contact.state}, ${contact.country}',
          image: path.addressImage,
          verticalMargin: 3,
        ),
      ],
    );
  }

}
