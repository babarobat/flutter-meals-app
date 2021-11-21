import 'package:flutter/material.dart';

import 'views/categories_screen.dart';
import 'views/category_meals_screen.dart';
import 'routs/routs.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final ThemeData theme = ThemeData();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: theme.textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontFamily: 'RobotoCondensed',
              color: Color.fromRGBO(20, 51, 51, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
      home: const CategoriesScreen(),
      routes: {
        Routs.categories : (ctx) => const CategoriesScreen(),
        Routs.categoryMeals: (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}
