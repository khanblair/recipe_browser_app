import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal $mealId')),
      body: const Center(
        child: Text('Recipe details coming soon'),
      ),
    );
  }
}
