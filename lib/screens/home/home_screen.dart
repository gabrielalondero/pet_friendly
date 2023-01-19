import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_friendly/screens/home/widgets/age_filter/age_filters.dart';
import 'package:pet_friendly/screens/home/widgets/card/custom_card.dart';
import 'package:pet_friendly/screens/home/widgets/custom_text_field.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/colors.dart' as color;
import 'package:pet_friendly/stores/home_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    homeStore.getPets;
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTextField(),
              const SizedBox(height: 22),
              const AgeFilters(),
              const SizedBox(height: 20),
              Observer(
                builder: (context) {
                  return Flexible(
                    child: ListView.builder(
                      //shrinkWrap: true,
                      itemCount: homeStore.animalsList.length,
                      itemBuilder: (_, index) {
                        if (homeStore.animalsList.isNotEmpty) {
                          return CustomCard(
                            animal: homeStore.animalsList[index],
                            index: index,
                          );
                        }
                        return Container();
                      },
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}
