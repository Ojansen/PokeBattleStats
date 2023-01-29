import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:poke_battle_stats/screens/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon, this.exists = false});

  final PokemonModel pokemon;
  final bool exists;

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<PokemonProvider>(context);

    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: CachedNetworkImage(
            imageUrl: pokemon.sprites?.other?.officialArtwork?.frontDefault as String,
          ),
        ),
        title: Text(pokemon.name as String),
        subtitle: Text("${pokemon.id}"),
        trailing: IconButton(
          onPressed: () => exists ? model.removeById(pokemon.id as int) : model.addPokemon(pokemon),
          icon: exists ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => PokemonDetailScreen(pokemon: pokemon),
          ),
        ),
      ),
    );
  }
}
