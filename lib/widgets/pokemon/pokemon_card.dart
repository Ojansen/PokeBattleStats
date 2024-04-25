import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_battle_stats/providers/pokemon_provider.dart';
import 'package:poke_battle_stats/widgets/pokemon/pokemon_type_list.dart';
import 'package:provider/provider.dart';

import '../../models/pokemon_model.dart';
import '../../screens/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon, this.exists = false});

  final PokemonModel pokemon;
  final bool exists;
  final bool addToFavorite = false;

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<PokemonProvider>(context);

    return Container(
      width: (MediaQuery.of(context).size.width * 1) - 32,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => PokemonDetailScreen(pokemon: pokemon),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "#${pokemon.id}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            pokemon.name as String,
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PokemonTypeList(pokemon: pokemon),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: CachedNetworkImage(
                  width: 150,
                  imageUrl: pokemon.sprites?.other?.home?.frontDefault as String,
                ),
              ),
              IconButton(
                onPressed: () => exists ? model.removeById(pokemon.id as int) : model.addPokemon(pokemon),
                icon: exists ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
              ),
            ],
          ),
        ),
      ),

      // ListTile(
      //   leading: SizedBox(
      //     width: 50,
      //     child: CachedNetworkImage(
      //       imageUrl: pokemon.sprites?.other?.officialArtwork?.frontDefault as String,
      //     ),
      //   ),
      //   title: Text(
      //     pokemon.name as String,
      //     style: const TextStyle(fontSize: 24),
      //   ),
      //   subtitle: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       SizedBox(
      //         width: 60,
      //         child: Text(
      //           "#${pokemon.id}",
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //       ),
      //       PokemonTypeList(pokemon: pokemon),
      //     ],
      //   ),
      //   trailing: IconButton(
      //     onPressed: () => exists ? model.removeById(pokemon.id as int) : model.addPokemon(pokemon),
      //     icon: exists ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
      //   ),
      //   onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => PokemonDetailScreen(pokemon: pokemon),
      //     ),
      //   ),
      // ),
    );
  }
}
