// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import "./screens/categories_screen.dart";
import "./screens/category_meals_screen.dart";
import "./screens/meal_detail_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
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
        "/": (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
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
