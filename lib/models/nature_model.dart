import 'package:json_annotation/json_annotation.dart';

part 'nature_model.g.dart';

@JsonSerializable()
class NatureModel {
  NatureModel({
    required this.decreasedStat,
    required this.hatesFlavor,
    required this.id,
    required this.increasedStat,
    required this.likesFlavor,
    required this.moveBattleStylePreferences,
    required this.name,
    required this.names,
    required this.pokeathlonStatChanges,
  });

  @JsonKey(name: 'decreased_stat')
  final DecreasedStat? decreasedStat;

  @JsonKey(name: 'hates_flavor')
  final DecreasedStat? hatesFlavor;
  final int? id;

  @JsonKey(name: 'increased_stat')
  final DecreasedStat? increasedStat;

  @JsonKey(name: 'likes_flavor')
  final DecreasedStat? likesFlavor;

  @JsonKey(name: 'move_battle_style_preferences')
  final List<MoveBattleStylePreference>? moveBattleStylePreferences;
  final String? name;
  final List<Name>? names;

  @JsonKey(name: 'pokeathlon_stat_changes')
  final List<PokeathlonStatChange>? pokeathlonStatChanges;

  NatureModel copyWith({
    DecreasedStat? decreasedStat,
    DecreasedStat? hatesFlavor,
    int? id,
    DecreasedStat? increasedStat,
    DecreasedStat? likesFlavor,
    List<MoveBattleStylePreference>? moveBattleStylePreferences,
    String? name,
    List<Name>? names,
    List<PokeathlonStatChange>? pokeathlonStatChanges,
  }) {
    return NatureModel(
      decreasedStat: decreasedStat ?? this.decreasedStat,
      hatesFlavor: hatesFlavor ?? this.hatesFlavor,
      id: id ?? this.id,
      increasedStat: increasedStat ?? this.increasedStat,
      likesFlavor: likesFlavor ?? this.likesFlavor,
      moveBattleStylePreferences: moveBattleStylePreferences ?? this.moveBattleStylePreferences,
      name: name ?? this.name,
      names: names ?? this.names,
      pokeathlonStatChanges: pokeathlonStatChanges ?? this.pokeathlonStatChanges,
    );
  }

  factory NatureModel.fromJson(Map<String, dynamic> json) => _$NatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$NatureModelToJson(this);

  @override
  String toString(){
    return "$decreasedStat, $hatesFlavor, $id, $increasedStat, $likesFlavor, $moveBattleStylePreferences, $name, $names, $pokeathlonStatChanges, ";
  }
}

@JsonSerializable()
class DecreasedStat {
  DecreasedStat({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  DecreasedStat copyWith({
    String? name,
    String? url,
  }) {
    return DecreasedStat(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory DecreasedStat.fromJson(Map<String, dynamic> json) => _$DecreasedStatFromJson(json);

  Map<String, dynamic> toJson() => _$DecreasedStatToJson(this);

  @override
  String toString(){
    return "$name, $url, ";
  }
}

@JsonSerializable()
class MoveBattleStylePreference {
  MoveBattleStylePreference({
    required this.highHpPreference,
    required this.lowHpPreference,
    required this.moveBattleStyle,
  });

  @JsonKey(name: 'high_hp_preference')
  final int? highHpPreference;

  @JsonKey(name: 'low_hp_preference')
  final int? lowHpPreference;

  @JsonKey(name: 'move_battle_style')
  final DecreasedStat? moveBattleStyle;

  MoveBattleStylePreference copyWith({
    int? highHpPreference,
    int? lowHpPreference,
    DecreasedStat? moveBattleStyle,
  }) {
    return MoveBattleStylePreference(
      highHpPreference: highHpPreference ?? this.highHpPreference,
      lowHpPreference: lowHpPreference ?? this.lowHpPreference,
      moveBattleStyle: moveBattleStyle ?? this.moveBattleStyle,
    );
  }

  factory MoveBattleStylePreference.fromJson(Map<String, dynamic> json) => _$MoveBattleStylePreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$MoveBattleStylePreferenceToJson(this);

  @override
  String toString(){
    return "$highHpPreference, $lowHpPreference, $moveBattleStyle, ";
  }
}

@JsonSerializable()
class Name {
  Name({
    required this.language,
    required this.name,
  });

  final DecreasedStat? language;
  final String? name;

  Name copyWith({
    DecreasedStat? language,
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
  String toString(){
    return "$language, $name, ";
  }
}

@JsonSerializable()
class PokeathlonStatChange {
  PokeathlonStatChange({
    required this.maxChange,
    required this.pokeathlonStat,
  });

  @JsonKey(name: 'max_change')
  final int? maxChange;

  @JsonKey(name: 'pokeathlon_stat')
  final DecreasedStat? pokeathlonStat;

  PokeathlonStatChange copyWith({
    int? maxChange,
    DecreasedStat? pokeathlonStat,
  }) {
    return PokeathlonStatChange(
      maxChange: maxChange ?? this.maxChange,
      pokeathlonStat: pokeathlonStat ?? this.pokeathlonStat,
    );
  }

  factory PokeathlonStatChange.fromJson(Map<String, dynamic> json) => _$PokeathlonStatChangeFromJson(json);

  Map<String, dynamic> toJson() => _$PokeathlonStatChangeToJson(this);

  @override
  String toString(){
    return "$maxChange, $pokeathlonStat, ";
  }
}
