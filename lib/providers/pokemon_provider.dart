import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_battle_stats/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart';

class PokemonProvider extends ChangeNotifier {
  final List<PokemonModel>  pokemonListState;
  String table = "Pokemon";
  final Database db;

  PokemonProvider(this.db, this.pokemonListState);

  Future<void> addPokemon(PokemonModel pokemon) async {
    await db.insert(table, {"id": pokemon.id, "pokemonJson": jsonEncode(pokemon)});
    pokemonListState.add(pokemon);
    notifyListeners();
  }

  Future<List<Map>> getOne(int pokemonId) async {
    return await db.query(table, where: "id = ?", whereArgs: [pokemonId]);
  }

  Future<void> removeById(int pokemonId) async {
    await db.delete('pokemon', where: 'id = ?', whereArgs: [pokemonId]);
    pokemonListState.removeWhere((element) => element.id == pokemonId);
    notifyListeners();
  }

  Future<List<Map<String, Object?>>> getAll() async {
    return await db.query(table);
  }
}
