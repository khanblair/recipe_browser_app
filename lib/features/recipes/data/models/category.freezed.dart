// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {
  String get idCategory;
  String get strCategory;
  String? get strCategoryThumb;
  String? get strCategoryDescription;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<Category> get copyWith =>
      _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Category &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, strCategory,
      strCategoryThumb, strCategoryDescription);

  @override
  String toString() {
    return 'Category(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription)';
  }
}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) =
      _$CategoryCopyWithImpl;
  @useResult
  $Res call(
      {String idCategory,
      String strCategory,
      String? strCategoryThumb,
      String? strCategoryDescription});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = freezed,
    Object? strCategoryDescription = freezed,
  }) {
    return _then(_self.copyWith(
      idCategory: null == idCategory
          ? _self.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _self.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: freezed == strCategoryThumb
          ? _self.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategoryDescription: freezed == strCategoryDescription
          ? _self.strCategoryDescription
          : strCategoryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Category implements Category {
  const _Category(
      {required this.idCategory,
      required this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});
  factory _Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  final String idCategory;
  @override
  final String strCategory;
  @override
  final String? strCategoryThumb;
  @override
  final String? strCategoryDescription;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Category &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, strCategory,
      strCategoryThumb, strCategoryDescription);

  @override
  String toString() {
    return 'Category(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription)';
  }
}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) =
      __$CategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String idCategory,
      String strCategory,
      String? strCategoryThumb,
      String? strCategoryDescription});
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = freezed,
    Object? strCategoryDescription = freezed,
  }) {
    return _then(_Category(
      idCategory: null == idCategory
          ? _self.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _self.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: freezed == strCategoryThumb
          ? _self.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategoryDescription: freezed == strCategoryDescription
          ? _self.strCategoryDescription
          : strCategoryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
