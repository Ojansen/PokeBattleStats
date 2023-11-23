import 'package:flutter/material.dart';
import 'package:poke_battle_stats/screens/nature_screen.dart';
import 'package:poke_battle_stats/screens/search_screen.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  static const List<String> _categories = [
    "Pokemon",
    "Moves",
    "Abilities",
    "Items",
    "Type",
    "Nature",
    "berry",
  ];

  var pageScreen = const SearchScreen(category: 'category');

  Widget navigateTo(String categoryName) {
    switch (categoryName) {
      case "Nature":
        return CategoryCard(
            name: categoryName,
            screen: NatureScreen(title: categoryName)
        );
      default:
        return CategoryCard(
            name: categoryName,
            screen: SearchScreen(category: categoryName)
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return navigateTo(_categories[index]);
        },
      ),
    );
  }
}
