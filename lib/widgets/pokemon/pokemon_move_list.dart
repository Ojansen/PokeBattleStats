import 'package:flutter/material.dart';
import 'package:poke_battle_stats/models/pokemon_model.dart';

class PokemonMoveList extends StatelessWidget {
  const PokemonMoveList({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        children: const [
          Text("move"),
        ]
          // for (var element in moves) {
          //   Text(element['move']['name']);
          // }

      ),
    );
  }
}
