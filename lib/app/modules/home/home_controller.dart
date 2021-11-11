import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/data/models/Character.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeController extends GetxController {
  List<Character> characters = <Character>[].obs;
  var buttonClicked = false;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future fetchCharacters() async {
    loading.value = true;
    String url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=60943d7dba0d794b3f7d761dcc782dca&hash=4dabb86d1d798da96d263aa0c9317096';
    final dio = Dio();
    final response = await dio.get(url);
    print(response.data);
    final list = response.data['data']['results'] as List;

    for (var json in list) {
      final character = Character.fromJson(json);
      characters.add(character);
    }

    for (var char in characters) {
      var paleta = await _updatePaletteGenerator(char);
      char.cor_dominante = paleta;
    }

    for (var char in characters) {
      print(char.cor_dominante);
    }
    loading.value = false;
  }

  Future<PaletteGenerator> _updatePaletteGenerator(Character character) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(character.thumbnail!).image,
    );
    return paletteGenerator;
  }

  filterByComics() {
    if (buttonClicked == false) {
      characters.sort((a, b) => b.comics!.length.compareTo(a.comics!.length));
      buttonClicked = true;
    } else {
      characters.sort((a, b) => a.comics!.length.compareTo(b.comics!.length));
      buttonClicked = false;
    }
  }
}
