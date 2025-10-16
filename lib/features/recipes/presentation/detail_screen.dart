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
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (m.strMealThumb != null)
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(imageUrl: m.strMealThumb!, fit: BoxFit.cover),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.strMeal, style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: [
                              if (m.strCategory != null) Chip(label: Text(m.strCategory!)),
                              if (m.strArea != null) Chip(label: Text(m.strArea!)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Ingredients', style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          ...ingredients.map((e) => Text('• ${e.key} ${e.value}'.trim())),
                          const SizedBox(height: 16),
                          Text('Instructions', style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text(m.strInstructions ?? '—'),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              if (m.strYoutube != null && m.strYoutube!.isNotEmpty)
                                FilledButton.icon(
                                  onPressed: () => launchUrlString(m.strYoutube!),
                                  icon: const Icon(Icons.ondemand_video),
                                  label: const Text('Watch'),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
      ),
    );
  }
}
