import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/pagination_model.dart';

class PetFinderService {
  final String _clientId = '3qKbIU8rdTdJOTBC3IQJimeJUtZoI3YvwfCyqilHzF5YydMfva';
  final String _clientSecret = 'KDQ5b9eiLtLHNLzDZxfp9aRopHvqteJLVStSEkxk';
  String tokenType = '';
  String accessToken = '';

  _getToken() async {
    http.Response response = await http.post(
      Uri.parse('https://api.petfinder.com/v2/oauth2/token'),
      body: {
        'grant_type': 'client_credentials',
        'client_id': _clientId,
        'client_secret': _clientSecret,
      },
    );
    var result = json.decode(response.body);
    tokenType = result['token_type'] ?? '';
    accessToken = result['access_token'] ?? '';
    print(tokenType);
    print(accessToken);
  }

  Future<PaginationModel?> _getAnimals(
      {required String type, required String age, required int page}) async {
    http.Response response = await http.get(
      //parâmetros type e age podem ser vazios
      Uri.parse(
          'https://api.petfinder.com/v2/animals?type=$type&age=$age&page=$page'),
      headers: {
        'Authorization': '$tokenType $accessToken',
      },
    );

    if (response.statusCode == 200) {
      
      List<AnimalModel> animals = [];
      PaginationModel pagination;
      
      (json.decode(response.body)['animals'] as List).forEach(
        (a) {
          animals.add(
            AnimalModel.fromJson(a),
          );
        },
      );
      pagination =
          PaginationModel.fromJson(json: json.decode(response.body)['pagination'], animalsList: animals);
      
      print(animals);
      print(pagination);
      
      return pagination;

      //var result2 = json.decode(response.body)['animals'];
      //print(result2[1]['photos']);
    }
    return null;
  }

  request() async {
    await _getToken();
    PaginationModel? animalsPage = await _getAnimals(page: 1, age: 'senior', type: 'cat');
    
  }
}
