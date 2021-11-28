import 'meal.dart';

abstract class Specification<T> {
  bool isValid(T instance);
}

class GlutenFree implements Specification<Meal> {
  @override
  bool isValid(Meal instance) {
    return instance.isGlutenFree;
  }
}

class Vegan implements Specification<Meal> {
  @override
  bool isValid(Meal instance) {
    return instance.isVegan;
  }
}

class Vegetarian implements Specification<Meal> {
  @override
  bool isValid(Meal instance) {
    return instance.isVegetarian;
  }
}

class LactoseFree implements Specification<Meal> {
  @override
  bool isValid(Meal instance) {
    return instance.isLactoseFree;
  }
}

class And<T> implements Specification<T> {
  final List<Specification<T>> specs = [];

  @override
  bool isValid(T instance) {
    for (var spec in specs) {
      if (!spec.isValid(instance)) {
        return false;
      }
    }
    return true;
  }
}

class Filter<T> {
  final GlutenFree _glutenFree = GlutenFree();
  final Vegan _vegan = Vegan();
  final Vegetarian _vegetarian = Vegetarian();
  final LactoseFree _lactoseFree = LactoseFree();

  final And<Meal> _all = And();

  bool get isGlutenFree => _all.specs.contains(_glutenFree);

  set isGlutenFree(value) =>
      value ? _all.specs.add(_glutenFree) : _all.specs.remove(_glutenFree);

  bool get isVegan => _all.specs.contains(_vegan);

  set isVegan(value) =>
      value ? _all.specs.add(_vegan) : _all.specs.remove(_vegan);

  bool get isVegetarian => _all.specs.contains(_vegetarian);

  set isVegetarian(value) =>
      value ? _all.specs.add(_vegetarian) : _all.specs.remove(_vegetarian);

  bool get isLactoseFree => _all.specs.contains(_lactoseFree);

  set isLactoseFree(value) =>
      value ? _all.specs.add(_lactoseFree) : _all.specs.remove(_lactoseFree);

  List<T> get<T>(Iterable<T> input) {
    return _get<T>(input, _all);
  }

  List<T> _get<T>(Iterable<T> input, Specification specification) {
    return input.where((x) => specification.isValid(x)).toList();
  }
}
