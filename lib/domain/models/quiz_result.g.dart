// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizResult _$QuizResultFromJson(Map<String, dynamic> json) => _QuizResult(
  userId: json['userId'] as String,
  category: json['category'] as String,
  correctAnswers: (json['correctAnswers'] as num).toInt(),
  totalQuestions: (json['totalQuestions'] as num).toInt(),
  completedAt: DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$QuizResultToJson(_QuizResult instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'category': instance.category,
      'correctAnswers': instance.correctAnswers,
      'totalQuestions': instance.totalQuestions,
      'completedAt': instance.completedAt.toIso8601String(),
    };
