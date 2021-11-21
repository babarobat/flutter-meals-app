import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = context.getArg('title');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('placeholder'),
      ),
    );
  }
}
