import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/models/meal.dart';

class DataService {
  final List<Meal> _meals = DUMMY_MEALS.toList();
  final List<Meal> _favorites = [];
  final Filter filter = Filter();

  void deleteMeal(Meal meal) {
    _meals.remove(meal);
  }

  List<Meal> getAllMealsByCategoryWithFilters(Category category) {
    var byCategory = _meals
        .where((element) => element.categories.contains(category.id))
        .toList();
    var filtered = filter.get<Meal>(byCategory);
    return filtered;
  }

  List<Meal> getFavorites() {
    return _favorites;
  }

  void markFavorite(Meal meal, bool favorite) {
    favorite ? _favorites.add(meal) : _favorites.remove(meal);
  }

  bool isFavorite(Meal meal) => _favorites.contains(meal);
}
