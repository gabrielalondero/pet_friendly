import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/contact_model.dart';
import 'package:pet_friendly/screens/details/widgets/carousel/carousel.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/stores/details_store.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.animal});

  final AnimalModel animal;
  final DetailsStore detailsStore = GetIt.I<DetailsStore>();

  final color = AllColors();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _about(animal: animal),
      _contact(animal: animal),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(color: color.pinkLight.withOpacity(0.53)),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Carousel(images: animal.images),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 25, left: 25, top: 5, bottom: 95),
                    child: Column(
                      children: [
                        _titles(
                          name: animal.name,
                          breed: '${animal.type} | ${animal.breeds}',
                          status: animal.status,
                        ),
                        Observer(
                          builder: (_) {
                            return _pages[detailsStore.currentPage];
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 67,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                          color: color.white,
                          border: Border.all(color: color.pinkLight, width: 1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _behindContainer(page: 0),
                          _behindContainer(page: 1),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _itemContainer(
                            page: 0,
                            image: path.aboutImage,
                            text: 'About',
                          ),
                          _itemContainer(
                            page: 1,
                            image: path.contactImage,
                            text: 'Contact',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contact({required AnimalModel animal}) {
    ContactModel? contact = animal.contact;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _customDivider(),
        _subtitle(subtitle: 'Contact'),
        const SizedBox(height: 12),
        _infoItem(
          text: contact.email,
          image: path.emailImage,
          verticalMargin: 3,
        ),
        _infoItem(
          text: contact.phone,
          image: path.phoneImage,
          verticalMargin: 3,
        ),
        _infoItem(
          text: '${contact.city}, ${contact.state}, ${contact.country}',
          image: path.addressImage,
          verticalMargin: 3,
        ),
      ],
    );
  }

  Widget _about({required AnimalModel animal}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _infoBox(
              image: animal.age.image,
              title: animal.age.title,
            ),
            _infoBox(
              image: path.sexGenderImage,
              title: animal.gender,
            ),
            _infoBox(
              image: path.sizeImage,
              title: animal.size,
            ),
          ],
        ),
        _customDivider(),
        _description(),
        _customDivider(),
        _characteristics(),
      ],
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subtitle(subtitle: 'Description'),
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
            _infoItem(
              text: animal.spayedNeutered ? 'Neutered' : 'Not neutered',
              image: path.neuteredImage,
            ),
            if (animal.houseTrained)
              _infoItem(text: 'House trained', image: path.houseTrainedImage),
            _infoItem(text: animal.colors, image: path.pelageColorImage),
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
          _subtitle(subtitle: 'Other characteristics'),
          const SizedBox(height: 15),
          SizedBox(
            height: 32,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: animal.tags.length,
              itemBuilder: (context, index) {
                return _infoItem(
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

  Widget _titles(
      {required String name, required String breed, required String status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                    color: color.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              status,
              style: TextStyle(
                  color: color.pink, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          breed,
          style: TextStyle(
            color: color.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _subtitle({required String subtitle}) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _infoBox({required String image, required String title}) {
    return Container(
      height: 76,
      width: 84,
      margin: const EdgeInsets.only(right: 7, left: 7),
      decoration: BoxDecoration(
          color: color.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: color.pinkLight)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 8),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 40,
              width: 47,
            ),
            Expanded(
                child: Center(
              child: Text(
                title,
                style: TextStyle(color: color.textColor, fontSize: 12),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _infoItem({
    required String text,
    required String image,
    bool withBackground = false,
    double horizontalMargin = 8,
    double verticalMargin = 0,
    double horizontalPadding = 0,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: withBackground ? color.white : Colors.transparent,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin, vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: color.pinkLight),
    );
  }

  Widget _behindContainer({required int page}) {
    return Observer(builder: (_) {
      return Container(
        height: page == detailsStore.currentPage ? 25 : 18,
        width: 147,
        decoration: BoxDecoration(
          color: color.pinkLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      );
    });
  }

  Widget _itemContainer(
      {required int page, required String image, required String text}) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          detailsStore.togglePage(page);
        },
        child: Container(
          height: 62,
          width: 147,
          padding: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                height: 25,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                  color: page == detailsStore.currentPage
                      ? color.pink
                      : color.grey,
                  fontSize: 12,
                  fontWeight: page == detailsStore.currentPage
                      ? FontWeight.w500
                      : FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
