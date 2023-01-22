class TypeModal {
  int id;
  String name;
  String damageClass;
  List doubleTo;
  List halfTo;
  List noTo;

  TypeModal({
    required this.id,
    required this.name,
    required this.damageClass,
    required this.doubleTo,
    required this.halfTo,
    required this.noTo,
  });

  factory TypeModal.fromJson(Map<String, dynamic> json) {
    return TypeModal(
      id: json['id'],
      name: json['name'],
      damageClass: json['move_damage_class']["name"],
      doubleTo: json["damage_relations"]["double_damage_to"],
      halfTo: json["damage_relations"]["half_damage_to"],
      noTo: json["damage_relations"]["no_damage_to"],
    );
  }
}
