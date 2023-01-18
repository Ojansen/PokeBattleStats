import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/pokemon_model.dart';

import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PartyListState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const NavigationBottomBar(),
      ),
    );
  }
}

class PartyListState extends ChangeNotifier {
  List<PokemonModel> partyListState = [
    PokemonModel(
      id: 493,
      name: "arceus",
      type: "normal",
      sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/493.png",
      // abilities: "None",
      stats: [
        {
          "base_stat": 120,
          "effort": 3,
          "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
        },
        {
          "base_stat": 120,
          "effort": 0,
          "stat": {"name": "attack", "url": "https://pokeapi.co/api/v2/stat/2/"}
        },
        {
          "base_stat": 120,
          "effort": 0,
          "stat": {"name": "defense", "url": "https://pokeapi.co/api/v2/stat/3/"}
        },
        {
          "base_stat": 120,
          "effort": 0,
          "stat": {"name": "special-attack", "url": "https://pokeapi.co/api/v2/stat/4/"}
        },
        {
          "base_stat": 120,
          "effort": 0,
          "stat": {"name": "special-defense", "url": "https://pokeapi.co/api/v2/stat/5/"}
        },
        {
          "base_stat": 120,
          "effort": 0,
          "stat": {"name": "speed", "url": "https://pokeapi.co/api/v2/stat/6/"}
        }
      ],
      moves: [
        {
          "move": {"name": "pound", "url": "https://pokeapi.co/api/v2/move/1/"},
          "version_group_details": [
            {
              "level_learned_at": 0,
              "move_learn_method": {"name": "machine", "url": "https://pokeapi.co/api/v2/move-learn-method/4/"},
            },
          ]
        }
      ],
    )
  ];

  void addPokemon(PokemonModel pokemon) {
    partyListState.add(pokemon);
    notifyListeners();
  }
}
