import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_friendly/screens/details/details_screen.dart';
import 'package:pet_friendly/screens/home/widgets/age_filters.dart';
import 'package:pet_friendly/screens/home/widgets/custom_card.dart';
import 'package:pet_friendly/screens/home/widgets/custom_dropdown_search.dart';
import 'package:pet_friendly/screens/offline_screen.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/connectivity_store.dart';
import 'package:pet_friendly/stores/home_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  final color = AllColors();

  late ReactionDisposer disposeReaction;

  @override
  void initState() {
    disposeReaction = autorun((_) {
      if (!connectivityStore.connected) {
        Future.delayed(const Duration(milliseconds: 50)).then(
          (value) => showDialog(
            context: context,
            builder: (_) => const OfflineScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: color.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(color: color.backgroundColor),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [               
                CustomDropdownSearch(),
                const SizedBox(height: 22),
                AgeFilters(),
                const SizedBox(height: 20),
                Observer(
                  builder: (context) {
                    return Flexible(
                      child: ListView.builder(
                        itemCount: homeStore.itemCount,
                        itemBuilder: (_, index) {
                          return Observer(builder: (context) {
                            if (index < homeStore.animalsList.length) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DetailsScreen(
                                        animal: homeStore.animalsList[index],
                                        index: index),
                                  ));
                                },
                                child: CustomCard(
                                  animal: homeStore.animalsList[index],
                                  index: index,
                                ),
                              );
                            }
                            //ao colocar todos os itens de uma página,
                            //;})carrega itens da próxima página
                            else if (homeStore.message == null) {
                              homeStore.loadingNextPage();
                            }
                            if (homeStore.loading) {
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 25),
                                height: 5,
                                child: const LinearProgressIndicator(),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.pets_outlined,
                                    color: color.pinkLight,
                                    size: 100,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    homeStore.message!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: color.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
  }
}
