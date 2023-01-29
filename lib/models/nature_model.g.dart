// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NatureModel _$NatureModelFromJson(Map<String, dynamic> json) => NatureModel(
      decreasedStat: json['decreased_stat'] == null
          ? null
          : DecreasedStat.fromJson(
              json['decreased_stat'] as Map<String, dynamic>),
      hatesFlavor: json['hates_flavor'] == null
          ? null
          : DecreasedStat.fromJson(
              json['hates_flavor'] as Map<String, dynamic>),
      id: json['id'] as int?,
      increasedStat: json['increased_stat'] == null
          ? null
          : DecreasedStat.fromJson(
              json['increased_stat'] as Map<String, dynamic>),
      likesFlavor: json['likes_flavor'] == null
          ? null
          : DecreasedStat.fromJson(
              json['likes_flavor'] as Map<String, dynamic>),
      moveBattleStylePreferences:
          (json['move_battle_style_preferences'] as List<dynamic>?)
              ?.map((e) =>
                  MoveBattleStylePreference.fromJson(e as Map<String, dynamic>))
              .toList(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokeathlonStatChanges: (json['pokeathlon_stat_changes'] as List<dynamic>?)
          ?.map((e) => PokeathlonStatChange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NatureModelToJson(NatureModel instance) =>
    <String, dynamic>{
      'decreased_stat': instance.decreasedStat,
      'hates_flavor': instance.hatesFlavor,
      'id': instance.id,
      'increased_stat': instance.increasedStat,
      'likes_flavor': instance.likesFlavor,
      'move_battle_style_preferences': instance.moveBattleStylePreferences,
      'name': instance.name,
      'names': instance.names,
      'pokeathlon_stat_changes': instance.pokeathlonStatChanges,
    };

DecreasedStat _$DecreasedStatFromJson(Map<String, dynamic> json) =>
    DecreasedStat(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DecreasedStatToJson(DecreasedStat instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

MoveBattleStylePreference _$MoveBattleStylePreferenceFromJson(
        Map<String, dynamic> json) =>
    MoveBattleStylePreference(
      highHpPreference: json['high_hp_preference'] as int?,
      lowHpPreference: json['low_hp_preference'] as int?,
      moveBattleStyle: json['move_battle_style'] == null
          ? null
          : DecreasedStat.fromJson(
              json['move_battle_style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveBattleStylePreferenceToJson(
        MoveBattleStylePreference instance) =>
    <String, dynamic>{
      'high_hp_preference': instance.highHpPreference,
      'low_hp_preference': instance.lowHpPreference,
      'move_battle_style': instance.moveBattleStyle,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: json['language'] == null
          ? null
          : DecreasedStat.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };

PokeathlonStatChange _$PokeathlonStatChangeFromJson(
        Map<String, dynamic> json) =>
    PokeathlonStatChange(
      maxChange: json['max_change'] as int?,
      pokeathlonStat: json['pokeathlon_stat'] == null
          ? null
          : DecreasedStat.fromJson(
              json['pokeathlon_stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokeathlonStatChangeToJson(
        PokeathlonStatChange instance) =>
    <String, dynamic>{
      'max_change': instance.maxChange,
      'pokeathlon_stat': instance.pokeathlonStat,
    };
