import 'package:flutter/material.dart';
import 'package:meals/adapters/meal_adapter.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/routs/routs.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function(Meal,bool) markFavoriteCallback;

  const MealItem({
    Key? key,
    required this.meal,
    required this.markFavoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {_onTap(context)},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(ConvertComplexity.toStringFrom(meal.complexity)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(ConvertAffordability.toStringFrom(
                          meal.affordability)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routs.mealDetail,
      arguments: <String, Object>{
        'meal': meal,
        'markFavoriteCallback': markFavoriteCallback,
      },
    );
  }
}
