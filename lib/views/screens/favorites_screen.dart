import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/services/data_service.dart';
import 'package:meals/views/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final DataService dataService;

  const FavoritesScreen({Key? key, required this.dataService})
      : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Meal> meals = widget.dataService.getFavorites();

    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals[index],
          markFavoriteCallback: _markFavoriteCallback,
        );
      },
    );
  }

  void _markFavoriteCallback(Meal meal, bool favorite) {
    setState(() {
      widget.dataService.markFavorite(meal, favorite);
    });
  }
}
