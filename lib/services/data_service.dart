import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';

class DataService {
  final List<Meal> _meals = DUMMY_MEALS.toList();

  void deleteMeal(Meal meal) {
    _meals.remove(meal);
  }

  List<Meal> getAllMealsByCategory(Category category) {
    return _meals
        .where((element) => element.categories.contains(category.id))
        .toList();
  }
}
