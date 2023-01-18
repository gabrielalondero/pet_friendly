class AgeModel {
  int? id;
  String title;
  String image;

  AgeModel({
    this.id,
    this.title = '',
    this.image = '',
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
    AgeModel(id: 0, image: 'images/ageFilter/babyAgeFilter.png', title: 'Baby');

final AgeModel young = AgeModel(
    id: 1, image: 'images/ageFilter/youngAgeFilter.png', title: 'Young');

final AgeModel adult = AgeModel(
    id: 2, image: 'images/ageFilter/adultAgeFilter.png', title: 'Adult');

final AgeModel senior = AgeModel(
    id: 3, image: 'images/ageFilter/oldAgeFilter.png', title: 'Senior');
