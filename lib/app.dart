import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'features/recipes/presentation/list_screen.dart';
import 'features/recipes/presentation/detail_screen.dart';

final _routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const RecipeListScreen(),
        routes: [
          GoRoute(
            path: 'detail/:id',
            name: 'detail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RecipeDetailScreen(mealId: id);
            },
          ),
        ],
      ),
    ],
  );
});

class RecipeBrowserApp extends ConsumerWidget {
  const RecipeBrowserApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(_routerProvider);
    return MaterialApp.router(
      title: 'Recipe Browser',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
