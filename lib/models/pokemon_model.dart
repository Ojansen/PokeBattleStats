import 'package:sqflite/sqflite.dart';

class PokemonModel {
  int id;
  String name;
  String type;
  String sprite;
  // String abilities;
  List<dynamic> stats;
  List<dynamic> moves;

  PokemonModel({
    required this.id,
    required this.name,
    required this.type,
    required this.sprite,
    // required this.abilities,
    required this.stats,
    required this.moves,
  });

  @override
  String toString() => '$name #$id, $type type';

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      sprite: json['sprites']['other']['official-artwork']['front_default'],
      // abilities: json['abilities']['ability']['name'],
      stats: json['stats'],
      moves: json['moves'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'sprite': sprite,
      // 'abilities': abilities,
      // 'stats': stats,
      // 'moves': moves,
    };
  }
}
