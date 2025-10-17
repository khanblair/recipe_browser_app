import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_skeleton.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/utils/debounce.dart';
import '../../../core/providers/theme_provider.dart';
import '../../favorites/favorites_service.dart';
import '../providers/recipes_providers.dart';

class RecipeListScreen extends ConsumerStatefulWidget {
  const RecipeListScreen({super.key});

  @override
  ConsumerState<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends ConsumerState<RecipeListScreen> {
  final _controller = ScrollController();
  final _debouncer = Debouncer(milliseconds: 400);
  int _page = 1;
  static const _pageSize = 20;
  bool _isPaginating = false;

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final isSearching = searchQuery.trim().isNotEmpty;
    final meals = isSearching ? ref.watch(searchResultsProvider) : ref.watch(mealsByCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: _AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (value) {
                _debouncer(() {
                  ref.read(searchQueryProvider.notifier).state = value;
                  if (value.isNotEmpty) {
                    ref.read(selectedCategoryProvider.notifier).state = null;
                  }
                  setState(() => _page = 1);
                });
              },
              decoration: InputDecoration(
                hintText: 'Search recipes…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        tooltip: 'Clear',
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          ref.read(searchQueryProvider.notifier).state = '';
                          setState(() => _page = 1);
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          categories.when(
            data: (data) {
              final chips = <Widget>[
                ChoiceChip(
                  label: const Text('All'),
                  selected: selectedCategory == null,
                  onSelected: (_) {
                    ref.read(searchQueryProvider.notifier).state = '';
                    ref.read(selectedCategoryProvider.notifier).state = null;
                    setState(() => _page = 1);
                  },
                ),
              ];
              chips.addAll(data.map((c) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ChoiceChip(
                      label: Text(c.strCategory),
                      selected: selectedCategory == c.strCategory,
                      onSelected: (_) {
                        ref.read(searchQueryProvider.notifier).state = '';
                        ref.read(selectedCategoryProvider.notifier).state = c.strCategory;
                        setState(() => _page = 1);
                      },
                    ),
                  )));
              return SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [const SizedBox(width: 4), ...chips, const SizedBox(width: 8)],
                ),
              );
            },
            loading: () => const SizedBox(
              height: 48,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [Expanded(child: AppSkeleton(height: 28))]),
              ),
            ),
            error: (e, st) => SizedBox(
              height: 48,
              child: Center(child: Text('Failed to load categories')),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: meals.when(
              data: (list) {
                final total = list.length;
                if (total == 0) {
                  final m = isSearching ? 'No results. Try a different search.' : 'Pick a category or search to begin.';
                  return EmptyState(message: m);
                }
                final end = (_page * _pageSize).clamp(0, total).toInt();
                final pageItems = list.take(end).toList();
                return NotificationListener<ScrollNotification>(
                  onNotification: (sn) {
                    // Trigger when near the bottom and only once per frame
                    final canLoadMore = end < total;
                    if (!_isPaginating && canLoadMore && sn.metrics.extentAfter < 300) {
                      _isPaginating = true;
                      setState(() => _page += 1);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _isPaginating = false;
                      });
                    }
                    return false;
                  },
                  child: ListView.separated(
                    controller: _controller,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      final meal = pageItems[index];
                      return _RecipeTile(
                        mealId: meal.idMeal,
                        title: meal.strMeal,
                        thumb: meal.strMealThumb,
                        category: meal.strCategory,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemCount: pageItems.length,
                  ),
                );
              },
              loading: () => ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (c, i) => const ListTile(
                  leading: CircleAvatar(child: AppSkeleton(height: 40, width: 40)),
                  title: AppSkeleton(),
                  subtitle: AppSkeleton(width: 120),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: 8,
              ),
              error: (e, st) => ErrorView(
                message: e.toString(),
                onRetry: () {
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeTile extends ConsumerWidget {
  const _RecipeTile({
    required this.mealId,
    required this.title,
    required this.thumb,
    this.category,
  });
  final String mealId;
  final String title;
  final String? thumb;
  final String? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favSvc = ref.watch(favoritesServiceProvider);
    final isFav = favSvc.isFav(mealId);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/detail/$mealId'),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Hero(
                tag: 'meal-$mealId',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: thumb == null
                        ? Container(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            child: const Icon(Icons.restaurant_menu, size: 32),
                          )
                        : CachedNetworkImage(
                            imageUrl: thumb!,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => Container(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (category != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        category!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : null,
                ),
                onPressed: () async {
                  await ref.read(favoritesListProvider.notifier).toggle(mealId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark || 
                   (themeMode == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.restaurant_menu,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(height: 8),
                Text(
                  'Recipe Browser',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              context.go('/favorites');
            },
          ),
          const Divider(),
          SwitchListTile(
            secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Dark Mode'),
            subtitle: Text(themeMode == ThemeMode.system ? 'System default' : (isDark ? 'On' : 'Off')),
            value: isDark,
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).state = 
                  value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_brightness),
            title: const Text('Use System Theme'),
            trailing: themeMode == ThemeMode.system 
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              ref.read(themeModeProvider.notifier).state = ThemeMode.system;
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Recipe Browser',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.restaurant_menu, size: 48),
                children: [
                  const Text('Browse recipes from TheMealDB API'),
                  const SizedBox(height: 8),
                  const Text('Built with Flutter & Riverpod'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
