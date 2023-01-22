import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poke_battle_stats/helpers/migrations.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/pokemon_model.dart';
import 'package:path/path.dart';

import 'navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var migration = Migrations();
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'pokemon.db');
  var exists = await databaseExists(path);

  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "pokemon.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    print("Opening existing database");
  }

  var db = await openDatabase(path, version: migration.version, onCreate: migration.createDatabase);
  List<Map<String, dynamic>> list = await db.query('pokemon');
  List<PokemonModel> result = [];

  for (Map<String, dynamic> map in list) {
    result.add(PokemonModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      sprite: map['sprite'],
      stats: map['stats'] ?? [],
      moves: map['moves'] ?? [],
    ));
  }
  print(result);

  runApp(MyApp(pokemonDatabase: db, pokemonListState: result));
}

class MyApp extends StatelessWidget {
  final Database pokemonDatabase;
  final List<PokemonModel> pokemonListState;

  const MyApp({super.key, required this.pokemonDatabase, required this.pokemonListState});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PartyListState>(create: (context) => PartyListState()),
        ChangeNotifierProvider<PokemonProvider>(
            create: (context) => PokemonProvider(pokemonDatabase, pokemonListState)),
      ],
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
