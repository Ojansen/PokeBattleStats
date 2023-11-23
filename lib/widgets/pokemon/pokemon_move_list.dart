import 'package:flutter/material.dart';
import 'package:poke_battle_stats/models/pokemon_model.dart';

class PokemonMoveList extends StatelessWidget {
  const PokemonMoveList({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    List<Row> allMoves = [];
    pokemon.moves?.forEach((Move element) {
      allMoves.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${element.move?.name}"),
          Text("${element.versionGroupDetails?[0].moveLearnMethod?.name}"),
          Text("${element.versionGroupDetails?[0].levelLearnedAt}")
        ],
      ));
    });
    return SizedBox(
      height: 300,
      child: Padding( padding: const EdgeInsets.all(16.0),
        child:ListView(
          children: allMoves,
        ),
      ),
    );
  }
}
