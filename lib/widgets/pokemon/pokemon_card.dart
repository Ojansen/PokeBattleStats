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
      child: InkWell(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PokemonDetailScreen(pokemon: pokemon),
        ),
      ),
        child: ListTile(
          leading: Image.network(pokemon.sprite),
          title: Text(pokemon.name),
          subtitle: Text(pokemon.toString()),
          trailing: InkWell(
            onTap: () {
              exists ? model.removeById(pokemon.id) : model.addPokemon(pokemon);
            },
            child: exists ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
          ),
        ),
      ),
    );
  }
}
