import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../widgets/pokemon/pokemon_move_list.dart';
import '../widgets/pokemon/pokemon_stats_radar_chart.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreen();
}

class _PokemonDetailScreen extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.pokemon.name)),
      ),
      body: SizedBox(
        child: ListView(
          children: [
            Image.network(widget.pokemon.sprite),
            PokemonRadarChart(pokemon: widget.pokemon),
            PokemonMoveList(pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
