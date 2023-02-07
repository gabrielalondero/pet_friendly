import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
import 'package:pet_friendly/stores/home_store.dart';
part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    _setupListener();
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;

  void _setupListener() {
    final internetConnectionChecker = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 5),
    );
    
    internetConnectionChecker.onStatusChange.listen((event) {
      setConnected(event == InternetConnectionStatus.connected);
    });
  }

}
