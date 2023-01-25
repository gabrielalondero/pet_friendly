import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pet_friendly/models/animal_model.dart';
import 'package:pet_friendly/models/pagination_model.dart';
import 'package:pet_friendly/models/type_model.dart';

class PetFinderService {
  final String _clientId = '3qKbIU8rdTdJOTBC3IQJimeJUtZoI3YvwfCyqilHzF5YydMfva';
  final String _clientSecret = 'KDQ5b9eiLtLHNLzDZxfp9aRopHvqteJLVStSEkxk';
  static String _tokenType = '';
  static String _accessToken = '';

  Future<void> setToken() async {
    await _getToken();
    Timer.periodic(const Duration(minutes: 58), (timer) async {
      await _getToken();
    });
  }

  Future<void> _getToken() async {
    http.Response response = await http.post(
      Uri.parse('https://api.petfinder.com/v2/oauth2/token'),
      body: {
        'grant_type': 'client_credentials',
        'client_id': _clientId,
        'client_secret': _clientSecret,
      },
    );
    var result = json.decode(response.body);
    _tokenType = result['token_type'] ?? '';
    _accessToken = result['access_token'] ?? '';
  }

  Future<PaginationModel> _getAnimals(
      {required String type, required String age, required int page}) async {
    PaginationModel pagination;

    http.Response response = await http.get(
      //parâmetros type e age podem ser vazios
      Uri.parse(
          'https://api.petfinder.com/v2/animals?type=$type&age=$age&page=$page'),
      headers: {
        'Authorization': '$_tokenType $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<AnimalModel> animals = [];
      (json.decode(response.body)['animals'] as List).forEach(
        (a) {
          animals.add(
            AnimalModel.fromJson(a),
          );
        },
      );
      pagination = PaginationModel.fromJson(
          json: json.decode(response.body)['pagination'], animalsList: animals);

      print(animals);
      print(pagination);

      //var result2 = json.decode(response.body)['animals'];
      //print(result2[1]['breeds']);
      //print(result2[1]['colors']);

      return pagination;
    }
    print('PARAMETROS INVÁLIDOS');
    print(json.decode(response.body)['invalid-params']);

    return pagination = PaginationModel(
        error: response.statusCode == 429
            ? 'Database unavailable. Please try again later.'
            : json.decode(response.body)['detail']);
  }

  Future<TypeModel?> getTypes() async {
    http.Response response = await http.get(
      Uri.parse('https://api.petfinder.com/v2/types'),
      headers: {
        'Authorization': '$_tokenType $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      return TypeModel.fromJson(json.decode(response.body)['types']);
    }
    return null;
  }

  Future<PaginationModel> requestGetPets(
      {required String type, required String age, required int page}) async {
    PaginationModel animalsPage =
        await _getAnimals(page: page, age: age, type: type);
    return animalsPage;
  }
}
