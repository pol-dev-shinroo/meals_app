// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import "../dummy_data.dart";
import "../widgets/meal_item.dart";
import "../models/meal.dart";

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  //It's important to note that initState() is only called once during the lifecycle of a StatefulWidget, when the widget is first inserted into the widget tree.
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs["title"]!;
      final categoryId = routeArgs["id"];

      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: displayedMeal[idx].id,
            title: displayedMeal[idx].title,
            imageUrl: displayedMeal[idx].imageUrl,
            duration: displayedMeal[idx].duration,
            complexity: displayedMeal[idx].complexity,
            affordability: displayedMeal[idx].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
