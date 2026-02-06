import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_statistics.freezed.dart';
part 'quiz_statistics.g.dart';

@freezed
abstract class QuizStatistics with _$QuizStatistics {
  const factory QuizStatistics({
    @Default(0) int totalQuizzes,
    @Default(0) int totalCorrectAnswers,
    @Default(0) int totalQuestions,
    @Default(0) int bestScore,
  }) = _QuizStatistics;

  const QuizStatistics._();

  double get averageScore {
    if (totalQuestions == 0) return 0;
    return (totalCorrectAnswers / totalQuestions * 100);
  }

  factory QuizStatistics.fromJson(Map<String, dynamic> json) =>
      _$QuizStatisticsFromJson(json);
}