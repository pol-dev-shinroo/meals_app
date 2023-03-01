import 'package:flutter/material.dart';
import "../screens/filters_screen.dart";

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  // use builder method if there is not build (context), if so extract it => better optimization.
  Widget buildListtile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListtile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          buildListtile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
