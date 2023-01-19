// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
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

  late final _$getPetsAsyncAction =
      AsyncAction('_HomeStore.getPets', context: context);

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  @override
  String toString() {
    return '''
animalsList: ${animalsList}
    ''';
  }
}
