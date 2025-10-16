import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_summary.freezed.dart';
part 'meal_summary.g.dart';

@freezed
abstract class MealSummary with _$MealSummary {
  const factory MealSummary({
    required String idMeal,
    required String strMeal,
    String? strMealThumb,
    String? strCategory,
  }) = _MealSummary;

  factory MealSummary.fromJson(Map<String, dynamic> json) => _$MealSummaryFromJson(json);
}
