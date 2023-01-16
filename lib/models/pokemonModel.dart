
class PokemonModel {
  int id;
  String name;
  String type;
  String sprite;
  // String abilities;

  PokemonModel({
    required this.id,
    required this.name,
    required this.type,
    required this.sprite,
    // required this.abilities,
  });

  @override
  String toString() =>
      'Pokemon: #$id, $name - $type type';

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      sprite: json['sprites']['other']['official-artwork']['front_default'],
      // abilities: json['abilities']['ability']['name'],
    );
  }

}