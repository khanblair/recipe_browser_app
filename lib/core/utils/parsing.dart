List<MapEntry<String, String>> parseIngredients(Map<String, dynamic> raw) {
  final List<MapEntry<String, String>> out = [];
  for (var i = 1; i <= 20; i++) {
    final ing = (raw['strIngredient$i'] as String?)?.trim();
    final meas = (raw['strMeasure$i'] as String?)?.trim();
    if (ing != null && ing.isNotEmpty) {
      out.add(MapEntry(ing, meas ?? ''));
    }
  }
  return out;
}
