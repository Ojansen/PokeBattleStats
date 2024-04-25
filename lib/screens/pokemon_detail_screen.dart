import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_battle_stats/widgets/pokemon/pokemon_type_list.dart';
import 'package:provider/provider.dart';

import '../models/pokemon_model.dart';
import '../providers/pokemon_provider.dart';
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
    var pokemonModel = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              pokemonModel.removeById(widget.pokemon.id!);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SizedBox(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemon.sprites?.other?.home?.frontDefault as String,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemon.sprites?.other?.home?.frontShiny as String,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(widget.pokemon.name as String,
                  style: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(fontSize: 48),
                  )),
            ),
            PokemonTypeList(pokemon: widget.pokemon),
            Column(
              children: [
                Row(
                  children: [
                    const Text("Abilities"),
                    Text("${widget.pokemon.abilities}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Weakness"),
                    Text("${widget.pokemon.baseExperience}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Base exp"),
                    Text("${widget.pokemon.baseExperience}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Height"),
                    Text("${widget.pokemon.height}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Weight"),
                    Text("${widget.pokemon.weight}"),
                  ],
                ),
              ],
            ),
            PokemonRadarChart(pokemon: widget.pokemon),
            PokemonMoveList(pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
