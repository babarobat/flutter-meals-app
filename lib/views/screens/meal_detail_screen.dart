import 'package:flutter/material.dart';
import 'package:meals/ext/build_context_extensions.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.getArgument<String>('title');

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
