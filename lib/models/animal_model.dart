import 'package:pet_friendly/models/age_model.dart';
import 'contact_model.dart';

class AnimalModel {
  int? id;

  String name = '';
  String type = '';
  String gender = '';
  String size = '';
  String description = '';
  String status = '';
  String breeds = '';
  String colors = '';

  AgeModel age;

  List<String> images = [];
  List<String> videos = [];
  List<String> tags = [];

  bool spayedNeutered = false;
  bool houseTrained = false;

  ContactModel contact;

  AnimalModel({
    required this.id,
    required this.name,
    required this.type,
    required this.age,
    required this.gender,
    required this.size,
    required this.description,
    required this.status,
    required this.images,
    required this.videos,
    required this.breeds,
    required this.colors,
    required this.tags,
    required this.spayedNeutered,
    required this.houseTrained,
    required this.contact,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    List<String> imagesList = [];
    if (json['photos'] != null) {
      (json['photos'] as List).forEach(
        (image) => imagesList.add(image['large']),
      );
    }

    List<String> videosList = [];
    if (json['videos'] != null) {
      (json['videos'] as List).forEach(
        (video) {
          String v = video['embed'];
          // padrão da String:
          //'<iframe src=\"https://www.youtube.com/embed/xaXbs1fRFRM\" frameborder=\"0\" allowfullscreen></iframe>'
          //para pegar só -> 'https://www.youtube.com/embed/xaXbs1fRFRM' :
          const start = "src=\"";
          const end = "\"";
          final startIndex = v.indexOf(start);
          final endIndex = v.indexOf(end, startIndex + start.length);
          v = v.substring(startIndex + start.length, endIndex);
          videosList.add(v);
        },
      );
    }
    videosList.add('https://www.youtube.com/watch?v=h_SO0J68C24');

    List<String> breedsList = [];
    String breedsResult = 'Breed not informed';
    if (json['breeds'] != null) {
      (json['breeds'] as Map).forEach((key, value) {
        if (value != null && key == 'primary') {
          breedsList.add(value);
        }
        if (value != null && key == 'secondary') {
          breedsList.add(value);
        }
      });
      if (breedsList.isNotEmpty) {
        breedsResult = breedsList.join(', ');
      }
    }

    List<String> colorsList = [];
    String colorsResult = 'Color not informed';
    if (json['colors'] != null) {
      (json['colors'] as Map).forEach((key, value) {
        if (value != null) {
          colorsList.add(value);
        }
      });
      if (colorsList.isNotEmpty) {
        colorsResult = colorsList.join(', ');
      }
    }

    String descriptionString = '';
    //converter escape em caracter
    if (json['description'] != null) {
      String text = json['description'];
      descriptionString = text
          .replaceAll(RegExp(r'(&amp;#39;|&#39;|&#039;)'), '\'')
          .replaceAll('&#34;', '"');
    }

    return AnimalModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown name',
      type: json['type'] ?? 'Unknown type',
      age: AgeModel.fromJson(json['age']),
      gender: json['gender'] ?? 'Unknown',
      size: json['size'] ?? 'Unknown',
      description: descriptionString,
      status: json['status'] ?? 'adoptable',
      breeds: breedsResult,
      colors: colorsResult,
      images: imagesList,
      videos: videosList,
      tags: json['tags'] != null ? List.from(json['tags']) : [],
      spayedNeutered: json['attributes']['spayed_neutered'] ?? false,
      houseTrained: json['attributes']['house_trained'] ?? false,
      contact: ContactModel.fromJson(json['contact']),
    );
  }

  @override
  String toString() {
    return 'Animal(id: $id, name: $name, type: $type, age: $age, gender: $gender, size: $size, description: $description, status: $status, breeds: $breeds, colors: $colors, images: $images, videos: $videos, tags: $tags, spayedNeutered: $spayedNeutered, houseTrained: $houseTrained, contact: $contact)';
  }
}
