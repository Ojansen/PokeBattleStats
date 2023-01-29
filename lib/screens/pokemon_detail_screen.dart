import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../widgets/pokemon/pokemon_move_list.dart';
import '../widgets/pokemon/pokemon_stats_radar_chart.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        title: Text(widget.pokemon.name as String),
      ),
      body: SizedBox(
        child: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: widget.pokemon.sprites?.other?.officialArtwork?.frontDefault as String,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            // PokemonRadarChart(pokemon: widget.pokemon),
            PokemonMoveList(pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
