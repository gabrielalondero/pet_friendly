import 'package:mobx/mobx.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/pagination_model.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      loading = true;
      PaginationModel? paginationModel =
          await PetFinderService().requestGetPets(
        age: filterAge,
        type: filterType,
        page: page,
      );
      addListPets(paginationModel);
      loading = false;
    });
  }

  @observable
  List<AnimalModel> animalsList = [];

  @observable
  String filterAge = '';

  @observable
  String filterType = '';

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @observable
  bool loading = false;

  @action
  Future<void> addListPets(PaginationModel? paginationModel) async {  
    if (paginationModel != null) {
      //se for menor que o número de itens por página, significa que acabou
      if (paginationModel.animals.length < 20) {
        lastPage = true;
      }
      animalsList += paginationModel.animals;
    }
  }

  //quando chegar no último item da lista, carrega a proxima página
  //cada página vêm 20
  @action
  void loadingNextPage() {
    page++;
  }

  @computed
  //o +1 é o item de carregamento no fim da lista
  //se estiver na útima página, não terá
  int get itemCount => lastPage ? animalsList.length : animalsList.length + 1;

  
}
