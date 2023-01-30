import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/screens/details/about_screen.dart';
import 'package:pet_friendly/screens/details/contact_screen.dart';
import 'package:pet_friendly/screens/details/widgets/titles.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/stores/details_store.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final DetailsStore detailsStore = GetIt.I<DetailsStore>();

  final color = AllColors();

  final List<Widget> _screens = [
    const AboutScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color.backgroundColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(color: color.pinkLight.withOpacity(0.53)),
        ),
        //extendBodyBehindAppBar: true,
        
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 5, bottom: 95),
                child: Column(
                  children: [
                    const SizedBox(height: 22),
                    Titles(
                      name: 'Nebula',
                      breed: 'American Shorthair',
                      status: 'Adoptable',
                    ),
                    Observer(
                      builder: (_) {
                        return _screens[detailsStore.currentPage];
                      },
                    ),
                  ],
                ),
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
                      : color.greyLight,
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
