import 'package:meals/models/meal.dart';

class ConvertComplexity {
  static String toStringFrom(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Simple';
      case Complexity.Hard:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }
}

class ConvertAffordability {
  static String toStringFrom(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
}
