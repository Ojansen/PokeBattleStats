import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:poke_battle_stats/helpers/migrations.dart';
import 'package:poke_battle_stats/models/all_nature_model.dart';
import 'package:poke_battle_stats/models/type_model.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:poke_battle_stats/providers/type_provider.dart';
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
  List<PokemonModel> pokemonList = await _futurePokemonList(db);
  // List<PokemonModel> pokemonList = [];
  List<TypeModel> typeList = [];
  // List<TypeModel> typeList = await _futureTypeList(db);
  // List<AllNatureModel> allNatureList = await _futureAllNatureList(db);

  // await deleteDatabase(path);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TypeProvider>(create: (context) => TypeProvider(db, typeList)),
        ChangeNotifierProvider<PokemonProvider>(create: (context) => PokemonProvider(db, pokemonList)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          useMaterial3: true,
        ),
        home: const NavigationBottomBar(),
      ),
    ),
  );
}

Future<dynamic> _futureAllNatureList(Database db) async {
  var response = await http.get(Uri.parse("https://pokeapi.co/api/v2/nature/"));
  if (response.statusCode == 200) {
    AllNatureModel allNatures = AllNatureModel.fromJson(jsonDecode(response.body));
    print(allNatures.results);
    allNatures.results?.forEach((element) {print(element.name);});
  }
}

Future<dynamic> _futureTypeList(Database db) async {
  List<Map<String, dynamic>> list = await db.query('type');
  if (list.isNotEmpty) {
    print("List is not empty");
    List<TypeModel> result = [];

    for (Map<String, dynamic> map in list) {
      result.add(TypeModel(
        id: map['id'],
        name: map['name'],
        // damageClass: map['damageClass'],
        doubleTo: map['doubleTo'],
        halfTo: map['halfTo'],
        noTo: map['noTo'],
      ));
    }
    return result;
  } else {
    var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    if (response.statusCode == 200) {
      List<dynamic> types = [];
      jsonDecode(response.body)['results'].forEach((row) {
        types.add(row['url']);
      });

      List<TypeModel> type = [];
      for (var index in types) {
        var typeRequest = await http.get(Uri.parse(index));
        if (jsonDecode(typeRequest.body)['id'] < 19) {
          type.add(TypeModel.fromJson(
            jsonDecode(typeRequest.body),
          ));
          db.insert('type', TypeModel.fromJson(jsonDecode(typeRequest.body)).toMap());
        }
      }
      return type;
    }
  }
}

Future<List<PokemonModel>> _futurePokemonList(Database db) async {
  List<Map<String, dynamic>> list = await db.query('pokemon');
  List<PokemonModel> result = [];

  // print(list);

  for (Map<String, dynamic> map in list) {
    print(map['pokemonJson']);
    result.add(PokemonModel.fromJson(jsonDecode(map['pokemonJson'])));
    // print(PokemonModel.fromJson(map['id']));
  }
  return result;
}
