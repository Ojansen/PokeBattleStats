import 'dart:typed_data';

class TypeModel {
  int id;
  String name;
  // String? damageClass;
  String? doubleTo;
  String? halfTo;
  String? noTo;

  TypeModel({
    required this.id,
    required this.name,
    // this.damageClass,
    this.doubleTo,
    this.halfTo,
    this.noTo,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'],
      name: json['name'],
      // damageClass: json['move_damage_class']["name"],
      doubleTo: json["damage_relations"]["double_damage_to"].toString(),
      halfTo: json["damage_relations"]["half_damage_to"].toString(),
      noTo: json["damage_relations"]["no_damage_to"].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      // 'damageClass': damageClass,
      'doubleTo': doubleTo,
      'halfTo': halfTo,
      'noTo': noTo,
    };
  }
}
