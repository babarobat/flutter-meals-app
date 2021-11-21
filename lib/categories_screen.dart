import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';
import 'package:meals/models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meals"),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(
                    color: category.color,
                    title: category.title,
                  ))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
