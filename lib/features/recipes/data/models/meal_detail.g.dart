// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealDetail _$MealDetailFromJson(Map<String, dynamic> json) => _MealDetail(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strCategory: json['strCategory'] as String?,
      strArea: json['strArea'] as String?,
      strInstructions: json['strInstructions'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      strYoutube: json['strYoutube'] as String?,
    );

Map<String, dynamic> _$MealDetailToJson(_MealDetail instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strInstructions': instance.strInstructions,
      'strMealThumb': instance.strMealThumb,
      'strYoutube': instance.strYoutube,
    };
