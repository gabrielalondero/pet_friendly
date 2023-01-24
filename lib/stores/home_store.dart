import 'package:mobx/mobx.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/pagination_model.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable
  List<AnimalModel> animalsList = [];

  @observable
  String selectedAgeFilter = '';

  @observable
  String selectedTypeFilter = '';

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @observable
  bool loading = false;

  @observable
  String? message;

  @observable
  List<String> typesList = [];

  @action
  void setAgeFilter(String value) {
    selectedAgeFilter = value == selectedAgeFilter ? '' : value;  
    resetPage();
    runRequestGetPets();
  }

  @action
  void setTypeFilter(String value) {
    if (value != selectedTypeFilter) {
      selectedTypeFilter = value == 'All' ? '' : value; 
      resetPage();
      runRequestGetPets();
    }
  }

  @action
  Future<void> runRequestGetPets() async {
    loading = true;
    PaginationModel paginationModel = await PetFinderService().requestGetPets(
      age: selectedAgeFilter,
      type: selectedTypeFilter,
      page: page,
    );
    addListPets(paginationModel);
    loading = false;
  }

  @action
  void addListPets(PaginationModel paginationModel) {
    if (paginationModel.error == null) {
      //se for menor que o número de itens por página, significa que acabou
      if (paginationModel.animals.length < 20) {
        lastPage = true;
      }
      animalsList += paginationModel.animals;
    } else {
      message = paginationModel.error;
    }
  }

  //quando chegar no último item da lista, carrega a proxima página
  //cada página vêm 20
  @action
  void loadingNextPage() {
    page++;
    runRequestGetPets();
  }

  //toda vez que usar algum filtro, reseta a lista
  void resetPage() {
    message = null;   
    page =  1;
    animalsList.clear();
    lastPage = false;
  }

  @computed
  //o +1 é o item de carregamento no fim da lista
  //se estiver na útima página, não terá
  int get itemCount => lastPage ? animalsList.length : animalsList.length + 1;

  //---------------------------------------------------------------------------------

  @action
  Future<void> runRequestGetTypes() async {
    List<String> types = await PetFinderService().getTypes();
    typesList = types;
    print(typesList);
  }
}
