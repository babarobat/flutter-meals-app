import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = context.getArgument<Category>();
    final List<Meal> meals = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
      ),
    );
  }
}
