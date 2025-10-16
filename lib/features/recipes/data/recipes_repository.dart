import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/api_paths.dart';
import '../../../core/errors/app_exception.dart';
import '../../../core/network/api_client.dart';
import 'models/category.dart';
import 'models/meal_detail.dart';
import 'models/meal_summary.dart';

abstract class RecipesRepository {
  Future<List<Category>> getCategories();
  Future<List<MealSummary>> getByCategory(String category);
  Future<List<MealSummary>> searchByName(String query);
  Future<MealDetail> getDetail(String id);
}

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl(this._client);
  final ApiClient _client;

  @override
  Future<List<Category>> getCategories() async {
    try {
      final res = await _client.dio.get(ApiPaths.categories);
      final list = (res.data['categories'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      return list.map(Category.fromJson).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw ParsingException('Failed to parse categories');
    }
  }

  @override
  Future<List<MealSummary>> getByCategory(String category) async {
    try {
      final res = await _client.dio.get(ApiPaths.filter, queryParameters: {'c': category});
      final list = (res.data['meals'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      // Filter endpoint doesn't return category, so we add it manually
      return list.map((e) => MealSummary.fromJson(e).copyWith(strCategory: category)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw ParsingException('Failed to parse meals by category');
    }
  }

  @override
  Future<List<MealSummary>> searchByName(String query) async {
    try {
      final res = await _client.dio.get(ApiPaths.search, queryParameters: {'s': query});
      final list = (res.data['meals'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      if (list.isEmpty) throw const EmptyResultException();
      return list.map((e) => MealSummary.fromJson(e)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error');
    } on EmptyResultException {
      rethrow;
    } catch (e) {
      throw ParsingException('Failed to parse search result');
    }
  }

  @override
  Future<MealDetail> getDetail(String id) async {
    try {
      final res = await _client.dio.get(ApiPaths.lookup, queryParameters: {'i': id});
      final list = (res.data['meals'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      if (list.isEmpty) {
        throw ServerException('Recipe not found');
      }
      final first = list.first;
      return MealDetail.fromJson(first).copyWith(raw: first);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw ParsingException('Failed to parse meal detail');
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());
final recipesRepositoryProvider = Provider<RecipesRepository>((ref) => RecipesRepositoryImpl(ref.watch(apiClientProvider)));
