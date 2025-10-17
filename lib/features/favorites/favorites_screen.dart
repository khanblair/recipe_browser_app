import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../recipes/providers/recipes_providers.dart';
import 'favorites_service.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(favoritesServiceProvider);
    final favs = svc.all();
    
    if (favs.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 80,
                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'No favorites yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the heart icon on recipes to save them here',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites (${favs.length})'),
        actions: [
          if (favs.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear all',
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Clear all favorites?'),
                    content: const Text('This will remove all saved recipes from your favorites.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  for (final id in favs) {
                    await ref.read(favoritesListProvider.notifier).toggle(id);
                  }
                }
              },
            ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: favs.length,
        itemBuilder: (context, i) {
          final id = favs[i];
          final detailProvider = mealDetailProvider(id);
          final detail = ref.watch(detailProvider);
          
          return detail.when(
            data: (meal) => Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => context.go('/detail/$id'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Hero(
                            tag: 'meal-$id',
                            child: meal.strMealThumb != null
                                ? CachedNetworkImage(
                                    imageUrl: meal.strMealThumb!,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                    child: const Icon(Icons.restaurant_menu, size: 48),
                                  ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
                                onPressed: () async {
                                  await ref.read(favoritesListProvider.notifier).toggle(id);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.strMeal,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          if (meal.strCategory != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              meal.strCategory!,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loading: () => Card(
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (e, st) => Card(
              child: InkWell(
                onTap: () => context.go('/detail/$id'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 8),
                    Text('Meal $id', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () async {
                        await ref.read(favoritesListProvider.notifier).toggle(id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
