import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/pokemonModel.dart';

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
    PokemonModel(id: 493, name: "arceus", type: "normal", sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/493.png")
  ];

  void addPokemon(PokemonModel pokemon) {
    partyListState.add(pokemon);
    notifyListeners();
  }
}