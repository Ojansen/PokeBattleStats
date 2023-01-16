import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_battle_stats/models/pokemonModel.dart';
import 'package:poke_battle_stats/widgets/pokemonCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PokemonModel> _data;

  Future<PokemonModel> fetchData() async {
    var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1'));
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<PokemonModel>(
          future: _data,
          builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                    PokemonCard(pokemon: snapshot.data!)
                // const Icon(
                //   Icons.check_circle_outline,
                //   color: Colors.green,
                //   size: 60,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 16),
                //   child: Column(
                //     children: [
                //       Image.network(snapshot.data!.sprite),
                //       Text('Result: ${snapshot.data}'),
                //     ],
                //   ),
                // ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
