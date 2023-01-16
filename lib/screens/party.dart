import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pokemonModel.dart';
import '../main.dart';
import '../widgets/pokemonCard.dart';

class PartyScreen extends StatefulWidget {
  const PartyScreen({super.key, required this.title});

  final String title;

  @override
  State<PartyScreen> createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  @override
  Widget build(BuildContext context) {
    List<PokemonModel> partyList = Provider.of<PartyListState>(context).partyListState;
    List<Widget> partyCards = [];

    for (var pokemon in partyList) {
      partyCards.add(PokemonCard(pokemon: pokemon));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: partyCards),
          )
        ],
      ),
    );
  }
}
