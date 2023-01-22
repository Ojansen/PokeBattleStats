import 'package:flutter/material.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  late final List<Widget> _categoryCards = [];
  static const List<String> _categories = [
    "Pokemon",
    "Moves",
    "Abilities",
    "Items",
    "Type",
    "Natures",
    "berry",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in _categories) {
      _categoryCards.add(CategoryCard(name: element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children:
          _categoryCards
      ),
    );
  }
}
