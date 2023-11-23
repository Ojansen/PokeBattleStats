import 'package:flutter/material.dart';
import 'package:poke_battle_stats/models/pokemon_model.dart';
import 'package:poke_battle_stats/widgets/type/type_label.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    List<TypeLabel> allTypes = [];
    pokemon.types?.forEach((Type element) {
      allTypes.add(
        TypeLabel(typeName: element.type?.name),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: allTypes,
    );
  }
}
