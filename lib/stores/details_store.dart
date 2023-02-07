import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:mobx/mobx.dart';
part 'details_store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  @observable
  int currentPage = 0;

  @observable
  int currentCarouselItem = 0;

  @action
  void setCurrentCarouselItem(int value) => currentCarouselItem = value; 

  @action
  void togglePage(int value) {
    value != currentPage ? currentPage = value : null;
  }

  @action
  void resetDetails() {
    currentPage = 0;
    currentCarouselItem = 0;
  }

  List<Map<String, dynamic>> mapList(
    List<String> images,
    List<String> videos,
  ) {
    List<Map<String, dynamic>> mapList = [];
    int index = 0;
    if (images.isEmpty) {
      images.add(path.defaultNetworkImage);
    }
    images.forEach((i) {
      mapList.add({
        'id': index,
        'type': 'image',
        'url': i,
      });
      index++;
    });
    videos.forEach((v) {
      mapList.add({
        'id': index,
        'type': 'video',
        'url': v,
      });
      index++;
    });
    return mapList;
  }
  
}
