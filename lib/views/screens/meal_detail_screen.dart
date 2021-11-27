import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = context.getArgumentByKey<Meal>('meal');
    final Function(Meal) onDeleteClickCallback =
        context.getArgumentByKey<Function(Meal)>('onDeleteClickCallback');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildIngredients(context, meal),
            _buildSteps(context, meal),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.error,
        child: const Icon(Icons.delete),
        onPressed: () {
          onDeleteClickCallback.call(meal);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildIngredients(BuildContext context, Meal meal) {
    return Column(
      children: [
        _buildName(context, 'Ingredients'),
        _buildContainer(
          context,
          ListView.builder(
            itemCount: meal.ingredients.length,
            itemBuilder: (c, i) => Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meal.ingredients[i],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSteps(BuildContext context, Meal meal) {
    return Column(
      children: [
        _buildName(context, 'Steps'),
        _buildContainer(
          context,
          ListView.builder(
            itemCount: meal.steps.length,
            itemBuilder: (c, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text('${i + 1}'),
                  ),
                  title: Text(meal.steps[i]),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName(BuildContext context, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        name,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      width: 350,
      height: 300,
      child: child,
    );
  }
}
