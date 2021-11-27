import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/services/data_service.dart';
import 'package:meals/views/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final DataService dataService;

  const CategoryMealsScreen({Key? key, required this.dataService})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final category = context.getArgument<Category>();
    final List<Meal> meals = widget.dataService.getAllMealsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            deleteCallback: _deleteMeal,
          );
        },
      ),
    );
  }

  void _deleteMeal(Meal meal) {
    setState(() {
      widget.dataService.deleteMeal(meal);
    });
  }
}
