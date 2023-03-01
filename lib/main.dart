// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import "package:meals_app/dummy_data.dart";
import './models/meal.dart';

import "./screens/categories_screen.dart";
import "./screens/category_meals_screen.dart";
import "./screens/meal_detail_screen.dart";
// import "./screens/tabs_screen.dart";
import "./screens/tabs_screen2.dart";
import "./screens/filters_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters["gluten"]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 253, 255, 253),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              displaySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              displayMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: const CategoriesScreen(),
      // initialRoute: "/",
      routes: {
        "/": (ctx) => const TabsScreen2(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // registering routes that are not registered in the routes map above. Hence, by default, if some route does not exist, it will render onGeneratedRoute instead
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == "/meal-detail"){
        //   return ...
        // }
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      // this is reached when flutter failed to build a screen with all other measures (last resort before it throws an error, flutter will try this fallback)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
