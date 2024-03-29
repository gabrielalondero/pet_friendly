// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on _DetailsStore, Store {
  late final _$currentPageAtom =
      Atom(name: '_DetailsStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$currentCarouselItemAtom =
      Atom(name: '_DetailsStore.currentCarouselItem', context: context);

  @override
  int get currentCarouselItem {
    _$currentCarouselItemAtom.reportRead();
    return super.currentCarouselItem;
  }

  @override
  set currentCarouselItem(int value) {
    _$currentCarouselItemAtom.reportWrite(value, super.currentCarouselItem, () {
      super.currentCarouselItem = value;
    });
  }

  late final _$_DetailsStoreActionController =
      ActionController(name: '_DetailsStore', context: context);

  @override
  void setCurrentCarouselItem(int value) {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.setCurrentCarouselItem');
    try {
      return super.setCurrentCarouselItem(value);
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePage(int value) {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.togglePage');
    try {
      return super.togglePage(value);
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDetails() {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.resetDetails');
    try {
      return super.resetDetails();
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
currentCarouselItem: ${currentCarouselItem}
    ''';
  }
}
