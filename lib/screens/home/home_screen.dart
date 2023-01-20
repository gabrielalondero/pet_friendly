import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/screens/home/widgets/age_filter/age_filters.dart';
import 'package:pet_friendly/screens/home/widgets/card/custom_card.dart';
import 'package:pet_friendly/screens/home/widgets/custom_text_field.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/home_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final color = AllColors();
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
                      itemCount: homeStore.itemCount,
                      itemBuilder: (_, index) {
                        if (index < homeStore.animalsList.length) {
                          return CustomCard(
                            animal: homeStore.animalsList[index],
                            index: index,
                          );
                        }
                        //ao colocar todos os itens de uma página,
                        //carrega itens da próxima página
                        homeStore.loadingNextPage();
                        if (homeStore.loading) {
                          return const SizedBox(
                            height: 10,
                            child: LinearProgressIndicator(),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.pets_outlined,
                                color: color.greyLight,
                                size: 100,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Nenhum pet foi encontrado :(',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: color.textColor,
                                ),
                              ),
                            ],
                          ),
                        );
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
