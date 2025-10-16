// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealSummary _$MealSummaryFromJson(Map<String, dynamic> json) => _MealSummary(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String?,
      strCategory: json['strCategory'] as String?,
    );

Map<String, dynamic> _$MealSummaryToJson(_MealSummary instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'strCategory': instance.strCategory,
    };
