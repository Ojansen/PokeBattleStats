// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      damageRelations: json['damage_relations'] == null
          ? null
          : DamageRelations.fromJson(
              json['damage_relations'] as Map<String, dynamic>),
      gameIndices: (json['game_indices'] as List<dynamic>?)
          ?.map((e) => GameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: json['generation'] == null
          ? null
          : Generation.fromJson(json['generation'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      moveDamageClass: json['move_damage_class'] == null
          ? null
          : Generation.fromJson(
              json['move_damage_class'] as Map<String, dynamic>),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastDamageRelations: (json['past_damage_relations'] as List<dynamic>?)
          ?.map((e) => PastDamageRelation.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemon: (json['pokemon'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'damage_relations': instance.damageRelations,
      'game_indices': instance.gameIndices,
      'generation': instance.generation,
      'id': instance.id,
      'move_damage_class': instance.moveDamageClass,
      'moves': instance.moves,
      'name': instance.name,
      'names': instance.names,
      'past_damage_relations': instance.pastDamageRelations,
      'pokemon': instance.pokemon,
    };

DamageRelations _$DamageRelationsFromJson(Map<String, dynamic> json) =>
    DamageRelations(
      doubleDamageFrom: (json['double_damage_from'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      doubleDamageTo: (json['double_damage_to'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageFrom: (json['half_damage_from'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageTo: (json['half_damage_to'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageFrom: (json['no_damage_from'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageTo: (json['no_damage_to'] as List<dynamic>?)
          ?.map((e) => Generation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DamageRelationsToJson(DamageRelations instance) =>
    <String, dynamic>{
      'double_damage_from': instance.doubleDamageFrom,
      'double_damage_to': instance.doubleDamageTo,
      'half_damage_from': instance.halfDamageFrom,
      'half_damage_to': instance.halfDamageTo,
      'no_damage_from': instance.noDamageFrom,
      'no_damage_to': instance.noDamageTo,
    };

Generation _$GenerationFromJson(Map<String, dynamic> json) => Generation(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$GenerationToJson(Generation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GameIndex _$GameIndexFromJson(Map<String, dynamic> json) => GameIndex(
      gameIndex: (json['game_index'] as num?)?.toInt(),
      generation: json['generation'] == null
          ? null
          : Generation.fromJson(json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameIndexToJson(GameIndex instance) => <String, dynamic>{
      'game_index': instance.gameIndex,
      'generation': instance.generation,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: json['language'] == null
          ? null
          : Generation.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };

PastDamageRelation _$PastDamageRelationFromJson(Map<String, dynamic> json) =>
    PastDamageRelation(
      damageRelations: json['damage_relations'] == null
          ? null
          : DamageRelations.fromJson(
              json['damage_relations'] as Map<String, dynamic>),
      generation: json['generation'] == null
          ? null
          : Generation.fromJson(json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PastDamageRelationToJson(PastDamageRelation instance) =>
    <String, dynamic>{
      'damage_relations': instance.damageRelations,
      'generation': instance.generation,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      pokemon: json['pokemon'] == null
          ? null
          : Generation.fromJson(json['pokemon'] as Map<String, dynamic>),
      slot: (json['slot'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'pokemon': instance.pokemon,
      'slot': instance.slot,
    };
