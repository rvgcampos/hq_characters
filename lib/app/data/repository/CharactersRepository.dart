import 'package:hq_characters/app/data/models/Character.dart';
import 'package:hq_characters/app/data/providers/CharactersProvider.dart';

class CharactersRepository {
  final CharactersProvider provider;
  CharactersRepository({required this.provider});

  Future<List<Character>> getAll({int page = 0}) {
    return provider.getAll(page: page);
  }
}
