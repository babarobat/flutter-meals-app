import 'package:flutter/material.dart';
import 'package:meals/routs/routs.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({
    Key? key,
    this.title = "category item",
    this.color = Colors.white,
  }) : super(key: key);

  void _openMealsScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routs.categoryMeals,
      arguments: {
        'title':title
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {_openMealsScreen(context)},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
