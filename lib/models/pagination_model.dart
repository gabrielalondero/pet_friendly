import 'package:pet_friendly/models/animal_model.dart';

class PaginationModel {
  int countPerPage;
  int totalCount;
  int currentPage;
  int totalPages;
  List<AnimalModel> animals;
  String? error;

  PaginationModel({
    this.countPerPage = 0,
    this.totalCount = 0,
    this.currentPage = 0,
    this.totalPages = 0,
    this.animals = const [],
    this.error,
  });

  factory PaginationModel.fromJson({
    required Map<String, dynamic> json,
    required List<AnimalModel> animalsList,
  }) {
    return PaginationModel(
      countPerPage: json['count_per_page'],
      totalCount: json['total_count'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'], 
      animals: animalsList,
    );
  }

 

  @override
  String toString() {
    return 'PaginationModel(countPerPage: $countPerPage, totalCount: $totalCount, currentPage: $currentPage, totalPages: $totalPages, animals: $animals)';
  }
}
