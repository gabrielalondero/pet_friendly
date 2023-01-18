import 'package:pet_friendly/models/animal_model.dart';

class PaginationModel {
  int? countPerPage;
  int? totalCount;
  int? currentPage;
  int? totalPages;
  List<AnimalModel> animals;

  PaginationModel({
    required this.countPerPage,
    required this.totalCount,
    required this.currentPage,
    required this.totalPages,
    required this.animals,
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
