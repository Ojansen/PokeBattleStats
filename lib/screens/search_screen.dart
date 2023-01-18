import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';
import '../widgets/pokemon/pokemon_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.category});

  final String category;

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  late TextEditingController _searchFieldController;
  late dynamic result = const Text("init");
  late dynamic model;

  
  void getModel(String category, String searchValue, dynamic responseBody) {
    switch (category) {
      case "Pokemon":
        PokemonModel searchedPokemon = PokemonModel.fromJson(jsonDecode(responseBody));
        setState(() {
          result = PokemonCard(pokemon: searchedPokemon);
        });
        break;
    }

  }

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.category)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchFieldController,
              onSubmitted: (String value) async {
                var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/${widget.category.toLowerCase()}/$value'));
                if (response.statusCode == 200) {
                  getModel(widget.category, value, response.body);
                } else {
                  setState(() {
                    result = const Text('Failed to load Pokemon');
                  });
                }
              },
            ),
            result
          ],
        ),
      )
    );
  }
}
