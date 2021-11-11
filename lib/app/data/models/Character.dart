import 'package:palette_generator/palette_generator.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  String? thumbnail_big;
  List<String>? comics;
  PaletteGenerator? cor_dominante;
  String? url;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.thumbnail_big,
    required this.comics,
    required this.url,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];

    var imagem = json['thumbnail']['path'];
    var tipo = json['thumbnail']['extension'] as String;
    String imagem_modificada;
    String imagem_modificada_grande;
    if (tipo == 'jpg') {
      imagem_modificada = imagem + '/portrait_xlarge.jpg';
      imagem_modificada_grande = imagem + '/portrait_uncanny.jpg';
    } else {
      imagem_modificada = imagem + '/portrait_xlarge.gif';
      imagem_modificada_grande = imagem + '/portrait_uncanny.gif';
    }
    thumbnail = imagem_modificada;
    thumbnail_big = imagem_modificada_grande;

    var lista_comics = json['comics']['items'];
    var lista_strings = <String>[];
    for (var item in lista_comics) {
      lista_strings.add(item['name']);
    }
    comics = lista_strings;

    url = json['urls'][0]['url'];
  }
}
