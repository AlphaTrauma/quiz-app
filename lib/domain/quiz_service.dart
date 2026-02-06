import 'package:dio/dio.dart';
import 'package:quizapp/domain/models/category.dart';
import 'package:quizapp/domain/models/question.dart';

class QuizService {
  static const String _apiKey = 'ns8aeZOHHDkGLKz7bfoCdMpDO5fjLSxHqzZQdj2i';
  final Dio _dio = Dio();

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _dio.get(
        'https://quizapi.io/api/v1/categories',
        options: Options(headers: {'X-Api-Key': _apiKey}),
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load categories: ${e.message}');
    }
  }

  Future<List<Question>> fetchQuestions(String categoryName, int limit) async {
  try {
    final response = await _dio.get(
      'https://quizapi.io/api/v1/questions',
      queryParameters: {
        'category': categoryName,
        'limit': limit,
      },
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    if (response.data is! List) {
      throw Exception('Unexpected response format: expected List, got ${response.data.runtimeType}');
    }

    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((item) => Question.fromJson(item as Map<String, dynamic>))
        .toList();
  } on DioException catch (e) {
    throw Exception('Failed to load questions: ${e.response?.data ?? e.message}');
  }
}
}
