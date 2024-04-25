import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable()
class TypeModel {
  TypeModel({
    required this.damageRelations,
    required this.gameIndices,
    required this.generation,
    required this.id,
    required this.moveDamageClass,
    required this.moves,
    required this.name,
    required this.names,
    required this.pastDamageRelations,
    required this.pokemon,
  });

  @JsonKey(name: 'damage_relations')
  final DamageRelations? damageRelations;

  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  final Generation? generation;
  final int? id;

  @JsonKey(name: 'move_damage_class')
  final Generation? moveDamageClass;
  final List<Generation>? moves;
  final String? name;
  final List<Name>? names;

  @JsonKey(name: 'past_damage_relations')
  final List<PastDamageRelation>? pastDamageRelations;
  final List<Pokemon>? pokemon;

  TypeModel copyWith({
    DamageRelations? damageRelations,
    List<GameIndex>? gameIndices,
    Generation? generation,
    int? id,
    Generation? moveDamageClass,
    List<Generation>? moves,
    String? name,
    List<Name>? names,
    List<PastDamageRelation>? pastDamageRelations,
    List<Pokemon>? pokemon,
  }) {
    return TypeModel(
      damageRelations: damageRelations ?? this.damageRelations,
      gameIndices: gameIndices ?? this.gameIndices,
      generation: generation ?? this.generation,
      id: id ?? this.id,
      moveDamageClass: moveDamageClass ?? this.moveDamageClass,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      names: names ?? this.names,
      pastDamageRelations: pastDamageRelations ?? this.pastDamageRelations,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);

  @override
  String toString() {
    return "$damageRelations, $gameIndices, $generation, $id, $moveDamageClass, $moves, $name, $names, $pastDamageRelations, $pokemon, ";
  }
}

@JsonSerializable()
class DamageRelations {
  DamageRelations({
    required this.doubleDamageFrom,
    required this.doubleDamageTo,
    required this.halfDamageFrom,
    required this.halfDamageTo,
    required this.noDamageFrom,
    required this.noDamageTo,
  });

  @JsonKey(name: 'double_damage_from')
  final List<Generation>? doubleDamageFrom;

  @JsonKey(name: 'double_damage_to')
  final List<Generation>? doubleDamageTo;

  @JsonKey(name: 'half_damage_from')
  final List<Generation>? halfDamageFrom;

  @JsonKey(name: 'half_damage_to')
  final List<Generation>? halfDamageTo;

  @JsonKey(name: 'no_damage_from')
  final List<Generation>? noDamageFrom;

  @JsonKey(name: 'no_damage_to')
  final List<Generation>? noDamageTo;

  DamageRelations copyWith({
    List<Generation>? doubleDamageFrom,
    List<Generation>? doubleDamageTo,
    List<Generation>? halfDamageFrom,
    List<Generation>? halfDamageTo,
    List<Generation>? noDamageFrom,
    List<Generation>? noDamageTo,
  }) {
    return DamageRelations(
      doubleDamageFrom: doubleDamageFrom ?? this.doubleDamageFrom,
      doubleDamageTo: doubleDamageTo ?? this.doubleDamageTo,
      halfDamageFrom: halfDamageFrom ?? this.halfDamageFrom,
      halfDamageTo: halfDamageTo ?? this.halfDamageTo,
      noDamageFrom: noDamageFrom ?? this.noDamageFrom,
      noDamageTo: noDamageTo ?? this.noDamageTo,
    );
  }

  factory DamageRelations.fromJson(Map<String, dynamic> json) => _$DamageRelationsFromJson(json);

  Map<String, dynamic> toJson() => _$DamageRelationsToJson(this);

  @override
  String toString() {
    return "$doubleDamageFrom, $doubleDamageTo, $halfDamageFrom, $halfDamageTo, $noDamageFrom, $noDamageTo, ";
  }
}

@JsonSerializable()
class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Generation copyWith({
    String? name,
    String? url,
  }) {
    return Generation(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Generation.fromJson(Map<String, dynamic> json) => _$GenerationFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationToJson(this);

  @override
  String toString() {
    return "$name, $url, ";
  }
}

@JsonSerializable()
class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final Generation? generation;

  GameIndex copyWith({
    int? gameIndex,
    Generation? generation,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      generation: generation ?? this.generation,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);

  @override
  String toString() {
    return "$gameIndex, $generation, ";
  }
}

@JsonSerializable()
class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Generation? language;
  final String? name;

  Name copyWith({
    Generation? language,
    String? name,
  }) {
    return Name(
      language: language ?? this.language,
      name: name ?? this.name,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  @override
  String toString() {
    return "$language, $name, ";
  }
}

@JsonSerializable()
class PastDamageRelation {
  PastDamageRelation({
    required this.damageRelations,
    required this.generation,
  });

  @JsonKey(name: 'damage_relations')
  final DamageRelations? damageRelations;
  final Generation? generation;

  PastDamageRelation copyWith({
    DamageRelations? damageRelations,
    Generation? generation,
  }) {
    return PastDamageRelation(
      damageRelations: damageRelations ?? this.damageRelations,
      generation: generation ?? this.generation,
    );
  }

  factory PastDamageRelation.fromJson(Map<String, dynamic> json) => _$PastDamageRelationFromJson(json);

  Map<String, dynamic> toJson() => _$PastDamageRelationToJson(this);

  @override
  String toString() {
    return "$damageRelations, $generation, ";
  }
}

@JsonSerializable()
class Pokemon {
  Pokemon({
    required this.pokemon,
    required this.slot,
  });

  final Generation? pokemon;
  final int? slot;

  Pokemon copyWith({
    Generation? pokemon,
    int? slot,
  }) {
    return Pokemon(
      pokemon: pokemon ?? this.pokemon,
      slot: slot ?? this.slot,
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @override
  String toString() {
    return "$pokemon, $slot, ";
  }
}
