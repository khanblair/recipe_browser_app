import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_skeleton.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/utils/debounce.dart';
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
      appBar: AppBar(title: const Text('Recipes')),
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
                final end = (_page * _pageSize).clamp(0, total);
                final pageItems = list.take(end).toList();
                return NotificationListener<ScrollNotification>(
                  onNotification: (sn) {
                    if (sn.metrics.pixels >= sn.metrics.maxScrollExtent - 200) {
                      if (end < total) {
                        setState(() => _page += 1);
                      }
                    }
                    return false;
                  },
                  child: ListView.separated(
                    controller: _controller,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final meal = pageItems[index];
                      return _RecipeTile(mealId: meal.idMeal, title: meal.strMeal, thumb: meal.strMealThumb);
                    },
                    separatorBuilder: (_, __) => const Divider(height: 1),
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
  const _RecipeTile({required this.mealId, required this.title, required this.thumb});
  final String mealId;
  final String title;
  final String? thumb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favSvc = ref.watch(favoritesServiceProvider);
    final isFav = favSvc.isFav(mealId);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: 56,
          height: 56,
          child: thumb == null
              ? const ColoredBox(color: Colors.black12)
              : CachedNetworkImage(imageUrl: thumb!, fit: BoxFit.cover),
        ),
      ),
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: const Text(''),
      trailing: IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
        onPressed: () async {
          await favSvc.toggle(mealId);
          ref.invalidate(favoritesListProvider);
        },
      ),
      onTap: () => context.go('/detail/$mealId'),
    );
  }
}
