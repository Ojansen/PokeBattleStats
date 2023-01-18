import 'package:flutter/material.dart';
import 'package:poke_battle_stats/screens/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
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
              var counter = context.read<PartyListState>();
              counter.addPokemon(pokemon);
            },
            child: const Icon(Icons.favorite_outline),
          ),
        ),
      ),
    );
  }
}
