import 'package:flutter/material.dart';
import "./categories_screen.dart";
import "./favorites_screen.dart";
import "../widgets/main_drawer.dart";

class TabsScreen2 extends StatefulWidget {
  const TabsScreen2({super.key});

  @override
  State<TabsScreen2> createState() => _TabsScreen2State();
}

class _TabsScreen2State extends State<TabsScreen2> {
  final List<Map<String, Object>> _pages = const [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoritesScreen(), "title": "Favorites"}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // selectedFontSize: 10,
        // unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
