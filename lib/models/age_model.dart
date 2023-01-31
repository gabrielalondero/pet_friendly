import 'package:pet_friendly/shared/images_path.dart' as path;
class AgeModel {
  int? id;
  String title;
  String image;

  AgeModel({
    this.id,
    this.title = 'Unknown age',
    this.image = path.ageYoungImage,
  });

  factory AgeModel.fromJson(String ageTitle) {
    AgeModel age = AgeModel();

    Map<String, AgeModel> mapAges = {
      'baby': baby,
      'young': young,
      'adult': adult,
      'senior': senior,
    };

    mapAges.forEach((key, value) {
      if (ageTitle.toLowerCase() == key) {
        age = value;
      }
    });
    print(age);
    return age;
  }

  @override
  String toString() => 'AgeModel(id: $id, title: $title, image: $image)';
}

final AgeModel baby =
    AgeModel(id: 0, image: path.ageBabyImage, title: 'Baby');

final AgeModel young = AgeModel(
    id: 1, image: path.ageYoungImage, title: 'Young');

final AgeModel adult = AgeModel(
    id: 2, image: path.ageAdultImage, title: 'Adult');

final AgeModel senior = AgeModel(
    id: 3, image: path.ageSeniorImage, title: 'Senior');
