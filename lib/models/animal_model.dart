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

  AgeModel? age;

  List<String> images = [];
  List<String> videos = [];
  List<String> tags = [];

  bool spayedNeutered = false;
  bool houseTrained = false;

  ContactModel? contact;

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
        (video) => videosList.add(video['embed']),
      );
    }

    List<String> breedsList = [];
    String breedsResult = '';
    if (json['breeds'] != null) {
      (json['breeds'] as Map).forEach((key, value) {
        if (value != null && key == 'primary') {
          breedsList.add(value);
        }
        if (value != null && key == 'secondary') {
          breedsList.add(value);
        }
      });
      breedsResult = breedsList.join(', ');
    }

    List<String> colorsList = [];
    String colorsResult = '';
    if (json['colors'] != null) {
      (json['colors'] as Map).forEach((key, value) {
        if (value != null) {
          colorsList.add(value);
        }
      });
      colorsResult = colorsList.join(', ');
    }

    return AnimalModel(
      id: json['id'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      age: AgeModel.fromJson(json['age']),
      gender: json['gender'] ?? '',
      size: json['size'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
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
