import 'package:flutter/material.dart';

import 'services/data_service.dart';
import 'views/screens/bottom_tabs_screen.dart';
import 'views/screens/categories_screen.dart';
import 'views/screens/category_meals_screen.dart';
import 'routs/routs.dart';
import 'views/screens/filters_screen.dart';
import 'views/screens/meal_detail_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final ThemeData theme = ThemeData();
  final DataService dataService = DataService();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xFF125BFF),
          secondary: const Color(0xFFD7ECFE),
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
        ),
      ),
      routes: {
        Routs.tabsScreen: (ctx) => const BottomTabsScreen(),
        Routs.categories: (ctx) => const CategoriesScreen(),
        Routs.categoryMeals: (ctx) => CategoryMealsScreen(dataService: dataService),
        Routs.mealDetail: (ctx) => const MealDetailScreen(),
        Routs.filters: (ctx) =>  FiltersScreen(dataService: dataService,),
      },
    );
  }
}
