import 'package:flutter/material.dart';

import 'screens/category_screen.dart';
import 'screens/home_screen.dart';
import 'screens/party_screen.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 2,
        backgroundColor: const Color(0xFFFFFFFF),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Party',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.apps),
            selectedIcon: Icon(Icons.grid_on),
            label: 'Effective chart',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      body: <Widget>[
        // const MyPartyPage(title: 'Home'),
        const PartyScreen(title: 'Party'),
        const HomeScreen(title: "Homepage"),
        const CategoriesScreen(title: "Categories"),
      ][currentPageIndex],
    );
  }
}
