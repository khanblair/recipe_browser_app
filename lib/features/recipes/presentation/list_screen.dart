import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search recipes…',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                SizedBox(width: 4),
                Chip(label: Text('All')),
                SizedBox(width: 8),
                Chip(label: Text('Seafood')),
                SizedBox(width: 8),
                Chip(label: Text('Dessert')),
                SizedBox(width: 8),
                Chip(label: Text('Vegetarian')),
                SizedBox(width: 8),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.restaurant_menu)),
                title: Text('Recipe #$index'),
                subtitle: const Text('Category'),
                onTap: () => context.go('/detail/${index + 1}'),
              ),
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
