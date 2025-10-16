import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _favoritesBoxName = 'favorites_box';

class FavoritesService {
  FavoritesService(this._box);
  final Box<String> _box;

  List<String> all() => _box.values.toList();
  bool isFav(String id) => _box.values.contains(id);
  Future<void> toggle(String id) async {
    if (isFav(id)) {
      final key = _box.keys.firstWhere((k) => _box.get(k) == id);
      await _box.delete(key);
    } else {
      await _box.add(id);
    }
  }
}

final hiveInitProvider = FutureProvider<void>((ref) async {
  await Hive.initFlutter();
  await Hive.openBox<String>(_favoritesBoxName);
});

final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  final box = Hive.box<String>(_favoritesBoxName);
  return FavoritesService(box);
});

final favoritesListProvider = StateProvider<List<String>>((ref) {
  final svc = ref.read(favoritesServiceProvider);
  return svc.all();
});
