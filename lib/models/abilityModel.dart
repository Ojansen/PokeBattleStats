
class AbilityModel {
  int id;
  String name;
  // String effect;

  AbilityModel({
    required this.id,
    required this.name,
    // required this.effect,
  });

  @override
  String toString() =>
      'Pokemon: #$id, $name';

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      id: json['id'],
      name: json['name'],
      // effect: json['effect_entries']['effect'],
    );
  }
}