import 'package:mobx/mobx.dart';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/pagination_model.dart';
import 'package:pet_friendly/services/pet_finder_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  
  @observable
  List<AnimalModel> animalsList = [];

  @action
  Future<void> getPets() async{
    PaginationModel? paginationModel = await PetFinderService().request(age: '', type: '', page: 1);
    if(paginationModel != null){
      animalsList = paginationModel.animals;
      print(animalsList);
    }
  }


}