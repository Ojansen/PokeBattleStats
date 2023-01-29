
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import '../../models/pokemon_model.dart';
//
// class PokemonRadarChart extends StatelessWidget {
//   PokemonRadarChart({super.key, required this.pokemon});
//
//   final PokemonModel pokemon;
//   final List<int> _maxStatsList = [50, 100, 150, 200, 250];
//   final List<String> _pokemonStatNames = [];
//   final List<int> _pokemonStatNumbers = [];
//
//   @override
//   Widget build(BuildContext context) {
//
//     for (var element in pokemon.stats) {
//       _pokemonStatNames.add("${element['stat']['name']} ${element['base_stat']} ");
//       _pokemonStatNumbers.add(
//           element['base_stat']
//       );
//     }
//
//     return SizedBox(
//       height: 300,
//       child: RadarChart.light(
//         ticks: _maxStatsList,
//         features: _pokemonStatNames,
//         data: [_pokemonStatNumbers],
//       ),
//     );
//   }
// }
