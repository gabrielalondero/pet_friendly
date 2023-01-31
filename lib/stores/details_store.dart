import 'package:mobx/mobx.dart';
part 'details_store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  @observable
  int currentPage = 0;

  @action
  void togglePage(int value) {
    value != currentPage ? currentPage = value : null;
  }

  @action 
  void resetPage() => currentPage = 0;
}
