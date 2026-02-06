// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizStatistics _$QuizStatisticsFromJson(Map<String, dynamic> json) =>
    _QuizStatistics(
      totalQuizzes: (json['totalQuizzes'] as num?)?.toInt() ?? 0,
      totalCorrectAnswers: (json['totalCorrectAnswers'] as num?)?.toInt() ?? 0,
      totalQuestions: (json['totalQuestions'] as num?)?.toInt() ?? 0,
      bestScore: (json['bestScore'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$QuizStatisticsToJson(_QuizStatistics instance) =>
    <String, dynamic>{
      'totalQuizzes': instance.totalQuizzes,
      'totalCorrectAnswers': instance.totalCorrectAnswers,
      'totalQuestions': instance.totalQuestions,
      'bestScore': instance.bestScore,
    };
