import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'details_store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  late PageController carouselController;

  @observable
  int currentPage = 0;

  @observable
  int currentImage = 0;

  @action
  void listenCarousel() {
    carouselController = PageController();
    carouselController.addListener(() {
      currentImage = carouselController.page!.round();
    });
  }

  @action
  void togglePage(int value) {
    value != currentPage ? currentPage = value : null;
  }

  @action
  void resetDetails() {
    currentPage = 0;
    currentImage = 0;
    carouselController.dispose();
  }
}
