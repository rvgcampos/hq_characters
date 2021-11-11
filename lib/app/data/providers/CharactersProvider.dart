import 'package:dio/dio.dart';
import 'package:hq_characters/app/data/models/Character.dart';

class CharactersProvider {
  final Dio dio;

  CharactersProvider({required this.dio});

  Future<List<Character>> getAll({int page = 0}) async {
    String url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=1&offset=${page * 20}&apikey=60943d7dba0d794b3f7d761dcc782dca&hash=4dabb86d1d798da96d263aa0c9317096';
    final characters = <Character>[];
    final response = await dio.get(url);
    final list = response.data['data']['results'] as List;

    for (var json in list) {
      final character = Character.fromJson(json);
      characters.add(character);
    }

    return characters;
  }
}
