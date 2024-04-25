import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:poke_battle_stats/helpers/migrations.dart';
import 'package:poke_battle_stats/models/all_nature_model.dart';
import 'package:poke_battle_stats/models/type_model.dart';
import 'package:poke_battle_stats/providers/nature_provider.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:poke_battle_stats/providers/type_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';
import 'models/nature_model.dart';
import 'models/pokemon_model.dart';
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
  List<NatureModel> natureList = await _futureAllNatureList(db);

  // await deleteDatabase(path);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TypeProvider>(create: (context) => TypeProvider(db, typeList)),
        ChangeNotifierProvider<PokemonProvider>(create: (context) => PokemonProvider(db, pokemonList)),
        ChangeNotifierProvider<NatureProvider>(create: (context) => NatureProvider(db, natureList)),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey,
            ),
            textTheme: GoogleFonts.interTextTheme()),
        home: const NavigationBottomBar(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

Future<dynamic> _futureAllNatureList(Database db) async {
  var response = await http.get(Uri.parse("https://pokeapi.co/api/v2/nature/?limit=25"));
  List<NatureModel> mapOfNatures = [];
  if (response.statusCode == 200) {
    AllNatureModel allNatures = AllNatureModel.fromJson(jsonDecode(response.body));
    allNatures.results?.forEach((element) async {
      var natureResponse = await http.get(Uri.parse(element.url as String));
      if (natureResponse.statusCode == 200) {
        await db.insert(natureTable, {"natureJson": jsonEncode(natureResponse.body)});
        mapOfNatures.add(NatureModel.fromJson(jsonDecode(natureResponse.body)));
      }
    });
  }

  return mapOfNatures;
}

Future<dynamic> _futureTypeList(Database db) async {
  List<Map<String, dynamic>> list = await db.query('type');
  if (list.isNotEmpty) {
    print("List is not empty");
    return list;
  } else {
    var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    if (response.statusCode == 200) {
      List<dynamic> types = [];
      jsonDecode(response.body)['results'].forEach((row) {
        types.add(row['url']);
      });

      List<TypeModel> type = [];
      for (var index in types) {
        print(index);
        var typeRequest = await http.get(Uri.parse(index.url));
        if (jsonDecode(typeRequest.body)['id'] < 19) {
          type.add(TypeModel.fromJson(
            jsonDecode(typeRequest.body),
          ));
          db.insert('type', {"typeJson": jsonEncode(typeRequest.body)});
        }
      }
      return type;
    }
  }
}

Future<List<PokemonModel>> _futurePokemonList(Database db) async {
  List<Map<String, dynamic>> list = await db.query('pokemon');
  List<PokemonModel> result = [];

  for (Map<String, dynamic> map in list) {
    result.add(
      PokemonModel.fromJson(jsonDecode(map['pokemonJson'])),
    );
  }
  return result;
}
