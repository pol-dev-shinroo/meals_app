// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import "../dummy_data.dart";
import "../widgets/meal_item.dart";

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
              id: categoryMeals[idx].id,
              title: categoryMeals[idx].title,
              imageUrl: categoryMeals[idx].imageUrl,
              duration: categoryMeals[idx].duration,
              complexity: categoryMeals[idx].complexity,
              affordability: categoryMeals[idx].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
