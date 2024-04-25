import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  PokemonModel({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<Ability>? abilities;

  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final List<Species>? forms;

  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  final int? height;

  @JsonKey(name: 'held_items')
  final List<dynamic>? heldItems;
  final int? id;

  @JsonKey(name: 'is_default')
  final bool? isDefault;

  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;

  @JsonKey(name: 'past_types')
  final List<dynamic>? pastTypes;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final int? weight;

  PokemonModel copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<dynamic>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) {
    return PokemonModel(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      height: height ?? this.height,
      heldItems: heldItems ?? this.heldItems,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      order: order ?? this.order,
      pastTypes: pastTypes ?? this.pastTypes,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  @override
  String toString(){
    return "$abilities, $baseExperience, $forms, $gameIndices, $height, $heldItems, $id, $isDefault, $locationAreaEncounters, $moves, $name, $order, $pastTypes, $species, $sprites, $stats, $types, $weight, ";
  }
}

@JsonSerializable()
class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species? ability;

  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) {
    return Ability(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  @override
  String toString(){
    return "$ability, $isHidden, $slot, ";
  }
}

@JsonSerializable()
class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);

  @override
  String toString(){
    return "$name, $url, ";
  }
}

@JsonSerializable()
class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final Species? version;

  GameIndex copyWith({
    int? gameIndex,
    Species? version,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);

  @override
  String toString(){
    return "$gameIndex, $version, ";
  }
}

@JsonSerializable()
class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final Species? move;

  @JsonKey(name: 'version_group_details')
  final List<VersionGroupDetail>? versionGroupDetails;

  Move copyWith({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) {
    return Move(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);

  @override
  String toString(){
    return "$move, $versionGroupDetails, ";
  }
}

@JsonSerializable()
class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  @JsonKey(name: 'level_learned_at')
  final int? levelLearnedAt;

  @JsonKey(name: 'move_learn_method')
  final Species? moveLearnMethod;

  @JsonKey(name: 'version_group')
  final Species? versionGroup;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Species? moveLearnMethod,
    Species? versionGroup,
  }) {
    return VersionGroupDetail(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);

  @override
  String toString(){
    return "$levelLearnedAt, $moveLearnMethod, $versionGroup, ";
  }
}

@JsonSerializable()
class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  @JsonKey(name: 'black-white')
  final Sprites? blackWhite;

  GenerationV copyWith({
    Sprites? blackWhite,
  }) {
    return GenerationV(
      blackWhite: blackWhite ?? this.blackWhite,
    );
  }

  factory GenerationV.fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationVToJson(this);

  @override
  String toString(){
    return "$blackWhite, ";
  }
}

@JsonSerializable()
class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  @JsonKey(name: 'diamond-pearl')
  final Sprites? diamondPearl;

  @JsonKey(name: 'heartgold-soulsilver')
  final Sprites? heartgoldSoulsilver;
  final Sprites? platinum;

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) {
    return GenerationIv(
      diamondPearl: diamondPearl ?? this.diamondPearl,
      heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
      platinum: platinum ?? this.platinum,
    );
  }

  factory GenerationIv.fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);

  @override
  String toString(){
    return "$diamondPearl, $heartgoldSoulsilver, $platinum, ";
  }
}

@JsonSerializable()
class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  @JsonKey(name: 'generation-i')
  final GenerationI? generationI;

  @JsonKey(name: 'generation-ii')
  final GenerationIi? generationIi;

  @JsonKey(name: 'generation-iii')
  final GenerationIii? generationIii;

  @JsonKey(name: 'generation-iv')
  final GenerationIv? generationIv;

  @JsonKey(name: 'generation-v')
  final GenerationV? generationV;

  @JsonKey(name: 'generation-vi')
  final Map<String, Home>? generationVi;

  @JsonKey(name: 'generation-vii')
  final GenerationVii? generationVii;

  @JsonKey(name: 'generation-viii')
  final GenerationViii? generationViii;

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) {
    return Versions(
      generationI: generationI ?? this.generationI,
      generationIi: generationIi ?? this.generationIi,
      generationIii: generationIii ?? this.generationIii,
      generationIv: generationIv ?? this.generationIv,
      generationV: generationV ?? this.generationV,
      generationVi: generationVi ?? this.generationVi,
      generationVii: generationVii ?? this.generationVii,
      generationViii: generationViii ?? this.generationViii,
    );
  }

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionsToJson(this);

  @override
  String toString(){
    return "$generationI, $generationIi, $generationIii, $generationIv, $generationV, $generationVi, $generationVii, $generationViii, ";
  }
}

@JsonSerializable()
class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'back_female')
  final dynamic backFemale;

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'back_shiny_female')
  final dynamic backShinyFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final dynamic frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      versions: versions ?? this.versions,
      animated: animated ?? this.animated,
    );
  }

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);

  @override
  String toString(){
    return "$backDefault, $backFemale, $backShiny, $backShinyFemale, $frontDefault, $frontFemale, $frontShiny, $frontShinyFemale, $other, $versions, $animated, ";
  }
}

@JsonSerializable()
class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;
  final RedBlue? yellow;

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) {
    return GenerationI(
      redBlue: redBlue ?? this.redBlue,
      yellow: yellow ?? this.yellow,
    );
  }

  factory GenerationI.fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);

  @override
  String toString(){
    return "$redBlue, $yellow, ";
  }
}

@JsonSerializable()
class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  @JsonKey(name: 'back_default')
  final dynamic backDefault;

  @JsonKey(name: 'back_gray')
  final dynamic backGray;

  @JsonKey(name: 'back_transparent')
  final dynamic backTransparent;

  @JsonKey(name: 'front_default')
  final dynamic frontDefault;

  @JsonKey(name: 'front_gray')
  final dynamic frontGray;

  @JsonKey(name: 'front_transparent')
  final dynamic frontTransparent;

  RedBlue copyWith({
    dynamic backDefault,
    dynamic backGray,
    dynamic backTransparent,
    dynamic frontDefault,
    dynamic frontGray,
    dynamic frontTransparent,
  }) {
    return RedBlue(
      backDefault: backDefault ?? this.backDefault,
      backGray: backGray ?? this.backGray,
      backTransparent: backTransparent ?? this.backTransparent,
      frontDefault: frontDefault ?? this.frontDefault,
      frontGray: frontGray ?? this.frontGray,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  factory RedBlue.fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);

  @override
  String toString(){
    return "$backDefault, $backGray, $backTransparent, $frontDefault, $frontGray, $frontTransparent, ";
  }
}

@JsonSerializable()
class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final Crystal? crystal;
  final Gold? gold;
  final Gold? silver;

  GenerationIi copyWith({
    Crystal? crystal,
    Gold? gold,
    Gold? silver,
  }) {
    return GenerationIi(
      crystal: crystal ?? this.crystal,
      gold: gold ?? this.gold,
      silver: silver ?? this.silver,
    );
  }

  factory GenerationIi.fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiToJson(this);

  @override
  String toString(){
    return "$crystal, $gold, $silver, ";
  }
}

@JsonSerializable()
class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  @JsonKey(name: 'back_default')
  final dynamic backDefault;

  @JsonKey(name: 'back_shiny')
  final dynamic backShiny;

  @JsonKey(name: 'back_shiny_transparent')
  final dynamic backShinyTransparent;

  @JsonKey(name: 'back_transparent')
  final dynamic backTransparent;

  @JsonKey(name: 'front_default')
  final dynamic frontDefault;

  @JsonKey(name: 'front_shiny')
  final dynamic frontShiny;

  @JsonKey(name: 'front_shiny_transparent')
  final dynamic frontShinyTransparent;

  @JsonKey(name: 'front_transparent')
  final dynamic frontTransparent;

  Crystal copyWith({
    dynamic backDefault,
    dynamic backShiny,
    dynamic backShinyTransparent,
    dynamic backTransparent,
    dynamic frontDefault,
    dynamic frontShiny,
    dynamic frontShinyTransparent,
    dynamic frontTransparent,
  }) {
    return Crystal(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
      backTransparent: backTransparent ?? this.backTransparent,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyTransparent: frontShinyTransparent ?? this.frontShinyTransparent,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  factory Crystal.fromJson(Map<String, dynamic> json) => _$CrystalFromJson(json);

  Map<String, dynamic> toJson() => _$CrystalToJson(this);

  @override
  String toString(){
    return "$backDefault, $backShiny, $backShinyTransparent, $backTransparent, $frontDefault, $frontShiny, $frontShinyTransparent, $frontTransparent, ";
  }
}

@JsonSerializable()
class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });

  @JsonKey(name: 'back_default')
  final dynamic backDefault;

  @JsonKey(name: 'back_shiny')
  final dynamic backShiny;

  @JsonKey(name: 'front_default')
  final dynamic frontDefault;

  @JsonKey(name: 'front_shiny')
  final dynamic frontShiny;

  @JsonKey(name: 'front_transparent')
  final dynamic frontTransparent;

  Gold copyWith({
    dynamic backDefault,
    dynamic backShiny,
    dynamic frontDefault,
    dynamic frontShiny,
    dynamic frontTransparent,
  }) {
    return Gold(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);

  @override
  String toString(){
    return "$backDefault, $backShiny, $frontDefault, $frontShiny, $frontTransparent, ";
  }
}

@JsonSerializable()
class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final OfficialArtwork? emerald;

  @JsonKey(name: 'firered-leafgreen')
  final Gold? fireredLeafgreen;

  @JsonKey(name: 'ruby-sapphire')
  final Gold? rubySapphire;

  GenerationIii copyWith({
    OfficialArtwork? emerald,
    Gold? fireredLeafgreen,
    Gold? rubySapphire,
  }) {
    return GenerationIii(
      emerald: emerald ?? this.emerald,
      fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
      rubySapphire: rubySapphire ?? this.rubySapphire,
    );
  }

  factory GenerationIii.fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);

  @override
  String toString(){
    return "$emerald, $fireredLeafgreen, $rubySapphire, ";
  }
}

@JsonSerializable()
class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  OfficialArtwork copyWith({
    String? frontDefault,
    String? frontShiny,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);

  @override
  String toString(){
    return "$frontDefault, $frontShiny, ";
  }
}

@JsonSerializable()
class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final dynamic frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final dynamic frontShinyFemale;

  Home copyWith({
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) {
    return Home(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);

  @override
  String toString(){
    return "$frontDefault, $frontFemale, $frontShiny, $frontShinyFemale, ";
  }
}

@JsonSerializable()
class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld? icons;

  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Home? ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) {
    return GenerationVii(
      icons: icons ?? this.icons,
      ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
    );
  }

  factory GenerationVii.fromJson(Map<String, dynamic> json) => _$GenerationViiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiToJson(this);

  @override
  String toString(){
    return "$icons, $ultraSunUltraMoon, ";
  }
}

@JsonSerializable()
class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final dynamic frontFemale;

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) {
    return DreamWorld(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);

  @override
  String toString(){
    return "$frontDefault, $frontFemale, ";
  }
}

@JsonSerializable()
class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld? icons;

  GenerationViii copyWith({
    DreamWorld? icons,
  }) {
    return GenerationViii(
      icons: icons ?? this.icons,
    );
  }

  factory GenerationViii.fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);

  @override
  String toString(){
    return "$icons, ";
  }
}

@JsonSerializable()
class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;
  final Home? home;

  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) {
    return Other(
      dreamWorld: dreamWorld ?? this.dreamWorld,
      home: home ?? this.home,
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);

  @override
  String toString(){
    return "$dreamWorld, $home, $officialArtwork, ";
  }
}

@JsonSerializable()
class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  final Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  String toString(){
    return "$baseStat, $effort, $stat, ";
  }
}

@JsonSerializable()
class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  String toString(){
    return "$slot, $type, ";
  }
}
