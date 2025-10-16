import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/utils/parsing.dart';
import '../../favorites/favorites_service.dart';
import '../providers/recipes_providers.dart';

class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(mealDetailProvider(mealId));
    final favSvc = ref.watch(favoritesServiceProvider);
    final isFav = favSvc.isFav(mealId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
            onPressed: () async {
              await favSvc.toggle(mealId);
              ref.invalidate(favoritesListProvider);
            },
          ),
        ],
      ),
      body: detail.when(
        data: (m) {
          final ingredients = m.raw != null ? parseIngredients(m.raw!) : const <MapEntry<String, String>>[];
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: m.strMealThumb != null
                      ? Hero(
                          tag: 'meal-$mealId',
                          child: CachedNetworkImage(
                            imageUrl: m.strMealThumb!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const Icon(Icons.restaurant_menu, size: 64),
                        ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m.strMeal,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (m.strCategory != null)
                            Chip(
                              avatar: const Icon(Icons.category, size: 18),
                              label: Text(m.strCategory!),
                            ),
                          if (m.strArea != null)
                            Chip(
                              avatar: const Icon(Icons.public, size: 18),
                              label: Text(m.strArea!),
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Ingredients',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: ingredients.map((e) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.fiber_manual_record, size: 8),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        '${e.key} ${e.value}'.trim(),
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Instructions',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            m.strInstructions ?? '—',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  height: 1.6,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (m.strYoutube != null && m.strYoutube!.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () => launchUrlString(m.strYoutube!),
                            icon: const Icon(Icons.play_circle_fill),
                            label: const Text('Watch Video Tutorial'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
                const SizedBox(height: 16),
                Text(
                  'Failed to load recipe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
