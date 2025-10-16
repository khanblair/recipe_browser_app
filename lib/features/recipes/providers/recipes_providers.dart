import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/category.dart';
import '../data/models/meal_detail.dart';
import '../data/models/meal_summary.dart';
import '../data/recipes_repository.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return ref.read(recipesRepositoryProvider).getCategories();
});

// Selected category state (null means 'All' - show from Beef category by default)
final selectedCategoryProvider = StateProvider<String?>((ref) => 'Beef');

// Meals by category
final mealsByCategoryProvider = FutureProvider.autoDispose<List<MealSummary>>((ref) async {
  final category = ref.watch(selectedCategoryProvider);
  if (category == null || category.isEmpty) {
    // When 'All' is selected, fetch from a default category (Beef)
    return ref.read(recipesRepositoryProvider).getByCategory('Beef');
  }
  return ref.read(recipesRepositoryProvider).getByCategory(category);
});

// Search query
final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider.autoDispose<List<MealSummary>>((ref) async {
  final q = ref.watch(searchQueryProvider);
  if (q.trim().isEmpty) return [];
  return ref.read(recipesRepositoryProvider).searchByName(q.trim());
});

// Detail
final mealDetailProvider = FutureProvider.family.autoDispose<MealDetail, String>((ref, id) async {
  return ref.read(recipesRepositoryProvider).getDetail(id);
});
