// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealDetail {
  String get idMeal;
  String get strMeal;
  String? get strCategory;
  String? get strArea;
  String? get strInstructions;
  String? get strMealThumb;
  String? get strYoutube; // Keep raw map for ingredient parsing outside model
  @JsonKey(ignore: true)
  Map<String, dynamic>? get raw;

  /// Create a copy of MealDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealDetailCopyWith<MealDetail> get copyWith =>
      _$MealDetailCopyWithImpl<MealDetail>(this as MealDetail, _$identity);

  /// Serializes this MealDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealDetail &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strArea, strArea) || other.strArea == strArea) &&
            (identical(other.strInstructions, strInstructions) ||
                other.strInstructions == strInstructions) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb) &&
            (identical(other.strYoutube, strYoutube) ||
                other.strYoutube == strYoutube) &&
            const DeepCollectionEquality().equals(other.raw, raw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idMeal,
      strMeal,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strYoutube,
      const DeepCollectionEquality().hash(raw));

  @override
  String toString() {
    return 'MealDetail(idMeal: $idMeal, strMeal: $strMeal, strCategory: $strCategory, strArea: $strArea, strInstructions: $strInstructions, strMealThumb: $strMealThumb, strYoutube: $strYoutube, raw: $raw)';
  }
}

/// @nodoc
abstract mixin class $MealDetailCopyWith<$Res> {
  factory $MealDetailCopyWith(
          MealDetail value, $Res Function(MealDetail) _then) =
      _$MealDetailCopyWithImpl;
  @useResult
  $Res call(
      {String idMeal,
      String strMeal,
      String? strCategory,
      String? strArea,
      String? strInstructions,
      String? strMealThumb,
      String? strYoutube,
      @JsonKey(ignore: true) Map<String, dynamic>? raw});
}

/// @nodoc
class _$MealDetailCopyWithImpl<$Res> implements $MealDetailCopyWith<$Res> {
  _$MealDetailCopyWithImpl(this._self, this._then);

  final MealDetail _self;
  final $Res Function(MealDetail) _then;

  /// Create a copy of MealDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strCategory = freezed,
    Object? strArea = freezed,
    Object? strInstructions = freezed,
    Object? strMealThumb = freezed,
    Object? strYoutube = freezed,
    Object? raw = freezed,
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
      strCategory: freezed == strCategory
          ? _self.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strArea: freezed == strArea
          ? _self.strArea
          : strArea // ignore: cast_nullable_to_non_nullable
              as String?,
      strInstructions: freezed == strInstructions
          ? _self.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strMealThumb: freezed == strMealThumb
          ? _self.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strYoutube: freezed == strYoutube
          ? _self.strYoutube
          : strYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      raw: freezed == raw
          ? _self.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MealDetail implements MealDetail {
  const _MealDetail(
      {required this.idMeal,
      required this.strMeal,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strYoutube,
      @JsonKey(ignore: true) final Map<String, dynamic>? raw})
      : _raw = raw;
  factory _MealDetail.fromJson(Map<String, dynamic> json) =>
      _$MealDetailFromJson(json);

  @override
  final String idMeal;
  @override
  final String strMeal;
  @override
  final String? strCategory;
  @override
  final String? strArea;
  @override
  final String? strInstructions;
  @override
  final String? strMealThumb;
  @override
  final String? strYoutube;
// Keep raw map for ingredient parsing outside model
  final Map<String, dynamic>? _raw;
// Keep raw map for ingredient parsing outside model
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic>? get raw {
    final value = _raw;
    if (value == null) return null;
    if (_raw is EqualUnmodifiableMapView) return _raw;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of MealDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealDetailCopyWith<_MealDetail> get copyWith =>
      __$MealDetailCopyWithImpl<_MealDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealDetail &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strArea, strArea) || other.strArea == strArea) &&
            (identical(other.strInstructions, strInstructions) ||
                other.strInstructions == strInstructions) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb) &&
            (identical(other.strYoutube, strYoutube) ||
                other.strYoutube == strYoutube) &&
            const DeepCollectionEquality().equals(other._raw, _raw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idMeal,
      strMeal,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strYoutube,
      const DeepCollectionEquality().hash(_raw));

  @override
  String toString() {
    return 'MealDetail(idMeal: $idMeal, strMeal: $strMeal, strCategory: $strCategory, strArea: $strArea, strInstructions: $strInstructions, strMealThumb: $strMealThumb, strYoutube: $strYoutube, raw: $raw)';
  }
}

/// @nodoc
abstract mixin class _$MealDetailCopyWith<$Res>
    implements $MealDetailCopyWith<$Res> {
  factory _$MealDetailCopyWith(
          _MealDetail value, $Res Function(_MealDetail) _then) =
      __$MealDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String idMeal,
      String strMeal,
      String? strCategory,
      String? strArea,
      String? strInstructions,
      String? strMealThumb,
      String? strYoutube,
      @JsonKey(ignore: true) Map<String, dynamic>? raw});
}

/// @nodoc
class __$MealDetailCopyWithImpl<$Res> implements _$MealDetailCopyWith<$Res> {
  __$MealDetailCopyWithImpl(this._self, this._then);

  final _MealDetail _self;
  final $Res Function(_MealDetail) _then;

  /// Create a copy of MealDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strCategory = freezed,
    Object? strArea = freezed,
    Object? strInstructions = freezed,
    Object? strMealThumb = freezed,
    Object? strYoutube = freezed,
    Object? raw = freezed,
  }) {
    return _then(_MealDetail(
      idMeal: null == idMeal
          ? _self.idMeal
          : idMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMeal: null == strMeal
          ? _self.strMeal
          : strMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: freezed == strCategory
          ? _self.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strArea: freezed == strArea
          ? _self.strArea
          : strArea // ignore: cast_nullable_to_non_nullable
              as String?,
      strInstructions: freezed == strInstructions
          ? _self.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strMealThumb: freezed == strMealThumb
          ? _self.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strYoutube: freezed == strYoutube
          ? _self.strYoutube
          : strYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      raw: freezed == raw
          ? _self._raw
          : raw // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
