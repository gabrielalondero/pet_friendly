// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount => (_$itemCountComputed ??=
          Computed<int>(() => super.itemCount, name: '_HomeStore.itemCount'))
      .value;

  late final _$animalsListAtom =
      Atom(name: '_HomeStore.animalsList', context: context);

  @override
  List<AnimalModel> get animalsList {
    _$animalsListAtom.reportRead();
    return super.animalsList;
  }

  @override
  set animalsList(List<AnimalModel> value) {
    _$animalsListAtom.reportWrite(value, super.animalsList, () {
      super.animalsList = value;
    });
  }

  late final _$selectedAgeFilterAtom =
      Atom(name: '_HomeStore.selectedAgeFilter', context: context);

  @override
  String get selectedAgeFilter {
    _$selectedAgeFilterAtom.reportRead();
    return super.selectedAgeFilter;
  }

  @override
  set selectedAgeFilter(String value) {
    _$selectedAgeFilterAtom.reportWrite(value, super.selectedAgeFilter, () {
      super.selectedAgeFilter = value;
    });
  }

  late final _$selectedTypeFilterAtom =
      Atom(name: '_HomeStore.selectedTypeFilter', context: context);

  @override
  String get selectedTypeFilter {
    _$selectedTypeFilterAtom.reportRead();
    return super.selectedTypeFilter;
  }

  @override
  set selectedTypeFilter(String value) {
    _$selectedTypeFilterAtom.reportWrite(value, super.selectedTypeFilter, () {
      super.selectedTypeFilter = value;
    });
  }

  late final _$pageAtom = Atom(name: '_HomeStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$lastPageAtom =
      Atom(name: '_HomeStore.lastPage', context: context);

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  late final _$loadingAtom = Atom(name: '_HomeStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$messageAtom = Atom(name: '_HomeStore.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$getPetsAsyncAction =
      AsyncAction('_HomeStore.getPets', context: context);

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setAgeFilter(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setAgeFilter');
    try {
      return super.setAgeFilter(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeFilter(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setTypeFilter');
    try {
      return super.setTypeFilter(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListPets(PaginationModel paginationModel) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.addListPets');
    try {
      return super.addListPets(paginationModel);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadingNextPage() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.loadingNextPage');
    try {
      return super.loadingNextPage();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animalsList: ${animalsList},
selectedAgeFilter: ${selectedAgeFilter},
selectedTypeFilter: ${selectedTypeFilter},
page: ${page},
lastPage: ${lastPage},
loading: ${loading},
message: ${message},
itemCount: ${itemCount}
    ''';
  }
}
