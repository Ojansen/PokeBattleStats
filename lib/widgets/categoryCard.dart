import 'package:flutter/material.dart';
import '../screens/search.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SearchPage(category: name),
              ),
            ),
            child: Center(
              child: Text(
                name,
              ),
            ),
          )),
    );
  }
}
