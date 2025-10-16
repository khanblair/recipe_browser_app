// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealSummary {
  String get idMeal;
  String get strMeal;
  String? get strMealThumb;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealSummaryCopyWith<MealSummary> get copyWith =>
      _$MealSummaryCopyWithImpl<MealSummary>(this as MealSummary, _$identity);

  /// Serializes this MealSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealSummary &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMeal, strMeal, strMealThumb);

  @override
  String toString() {
    return 'MealSummary(idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb)';
  }
}

/// @nodoc
abstract mixin class $MealSummaryCopyWith<$Res> {
  factory $MealSummaryCopyWith(
          MealSummary value, $Res Function(MealSummary) _then) =
      _$MealSummaryCopyWithImpl;
  @useResult
  $Res call({String idMeal, String strMeal, String? strMealThumb});
}

/// @nodoc
class _$MealSummaryCopyWithImpl<$Res> implements $MealSummaryCopyWith<$Res> {
  _$MealSummaryCopyWithImpl(this._self, this._then);

  final MealSummary _self;
  final $Res Function(MealSummary) _then;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strMealThumb = freezed,
  }) {
    return _then(_self.copyWith(
      idMeal: null == idMeal
          ? _self.idMeal
          : idMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMeal: null == strMeal
          ? _self.strMeal
          : strMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMealThumb: freezed == strMealThumb
          ? _self.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MealSummary implements MealSummary {
  const _MealSummary(
      {required this.idMeal, required this.strMeal, this.strMealThumb});
  factory _MealSummary.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryFromJson(json);

  @override
  final String idMeal;
  @override
  final String strMeal;
  @override
  final String? strMealThumb;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealSummaryCopyWith<_MealSummary> get copyWith =>
      __$MealSummaryCopyWithImpl<_MealSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealSummary &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMeal, strMeal, strMealThumb);

  @override
  String toString() {
    return 'MealSummary(idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb)';
  }
}

/// @nodoc
abstract mixin class _$MealSummaryCopyWith<$Res>
    implements $MealSummaryCopyWith<$Res> {
  factory _$MealSummaryCopyWith(
          _MealSummary value, $Res Function(_MealSummary) _then) =
      __$MealSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({String idMeal, String strMeal, String? strMealThumb});
}

/// @nodoc
class __$MealSummaryCopyWithImpl<$Res> implements _$MealSummaryCopyWith<$Res> {
  __$MealSummaryCopyWithImpl(this._self, this._then);

  final _MealSummary _self;
  final $Res Function(_MealSummary) _then;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strMealThumb = freezed,
  }) {
    return _then(_MealSummary(
      idMeal: null == idMeal
          ? _self.idMeal
          : idMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMeal: null == strMeal
          ? _self.strMeal
          : strMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMealThumb: freezed == strMealThumb
          ? _self.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
