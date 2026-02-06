import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result.freezed.dart';
part 'quiz_result.g.dart';

@freezed
abstract class QuizResult with _$QuizResult {
  const factory QuizResult({
    required String userId,
    required String category,
    required int correctAnswers,
    required int totalQuestions,
    required DateTime completedAt,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) =>
      _$QuizResultFromJson(json);
}

