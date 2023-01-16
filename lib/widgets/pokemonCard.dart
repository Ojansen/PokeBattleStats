import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/pokemonModel.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          var counter = context.read<PartyListState>();
          counter.addPokemon(pokemon);
        },
        child: ListTile(
          leading: Image.network(pokemon.sprite),
          title: Text(pokemon.name),
          subtitle: Text(pokemon.toString()),
          trailing: const Icon(Icons.favorite_outline),
        ),
      ),
    );
  }
}
