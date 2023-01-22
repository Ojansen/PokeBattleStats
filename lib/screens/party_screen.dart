import 'package:flutter/material.dart';
import 'package:poke_battle_stats/models/pokemon_model.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon/pokemon_card.dart';

class PartyScreen extends StatefulWidget {
  const PartyScreen({super.key, required this.title});

  final String title;

  @override
  State<PartyScreen> createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  late final List<Widget> partyCardList = [];

  @override
  Widget build(BuildContext context) {
    var pokemonList = context.watch<PokemonProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView.builder(
        itemCount: pokemonList.pokemonListState.length,
        itemBuilder: (context, index) => PokemonCard(
          pokemon: pokemonList.pokemonListState[index],
          exists: true,
        ),
      ),
      // body: FutureBuilder<dynamic>(
      //   future: Provider.of<PokemonProvider>(context).getAll(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     List<Widget> children;
      //     if (snapshot.hasData) {
      //       snapshot.data.forEach((row) {
      //         partyCardList.add(PokemonCard(
      //           exists: true,
      //           pokemon: PokemonModel(
      //             id: row['id'],
      //             name: row['name'],
      //             type: row['type'],
      //             sprite: row['sprite'],
      //             stats: row['stats'] ?? [],
      //             moves: [],
      //           ),
      //         ));
      //       });
      //       children = partyCardList;
      //     } else if (snapshot.hasError) {
      //       children = <Widget>[
      //         const Icon(
      //           Icons.error_outline,
      //           color: Colors.red,
      //           size: 60,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 16),
      //           child: Text('Error: ${snapshot.error}'),
      //         ),
      //       ];
      //     } else {
      //       children = const <Widget>[
      //         SizedBox(
      //           width: 60,
      //           height: 60,
      //           child: CircularProgressIndicator(),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: 16),
      //           child: Text('Awaiting result...'),
      //         ),
      //       ];
      //     }
      //     return Center(
      //       child: ListView(
      //         children: children,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
