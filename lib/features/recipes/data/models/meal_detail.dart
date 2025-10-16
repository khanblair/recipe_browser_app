import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_detail.freezed.dart';
part 'meal_detail.g.dart';

@freezed
abstract class MealDetail with _$MealDetail {
  const factory MealDetail({
    required String idMeal,
    required String strMeal,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    String? strYoutube,
    // Keep raw map for ingredient parsing outside model
    @JsonKey(ignore: true) Map<String, dynamic>? raw,
  }) = _MealDetail;

  factory MealDetail.fromJson(Map<String, dynamic> json) => _$MealDetailFromJson(json);
}
