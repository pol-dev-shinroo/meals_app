// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  const CategoryMealsScreen({super.key});

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle, {super.key}) {
  //   print('categoryId: $categoryId and categoryTitle: $categoryTitle');
  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder());
  }
}
