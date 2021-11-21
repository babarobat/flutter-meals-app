import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = context.getArg('title');
    final String id = context.getArg('id');
    final List<Meal> meals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final item = meals[index];
          return MealItem(
            key: key,
            title: item.title,
            imageUrl: item.imageUrl,
            duration: item.duration,
            affordability: item.affordability,
            complexity: item.complexity,
          );
        },
      ),
    );
  }
}
