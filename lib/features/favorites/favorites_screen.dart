import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'favorites_service.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(favoritesServiceProvider);
    final favs = svc.all();
    if (favs.isEmpty) {
      return const Scaffold(body: Center(child: Text('No favorites yet')));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ListView.separated(
        itemBuilder: (c, i) {
          final id = favs[i];
          return ListTile(
            title: Text('Meal $id'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                await svc.toggle(id);
                (ref as dynamic).invalidate(favoritesListProvider);
              },
            ),
            onTap: () => context.go('/detail/$id'),
          );
        },
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: favs.length,
      ),
    );
  }
}
