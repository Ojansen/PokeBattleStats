
class ItemModel {
  int id;
  String name;
  String cost;
  String effect;
  String sprite;

  ItemModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.effect,
    required this.sprite,
  });

  @override
  String toString() =>
      'Pokemon: #$id, $name P$cost - $effect';

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      effect: json['effect_entries']['effect'],
      sprite: json['sprites']['default'],
    );
  }
}