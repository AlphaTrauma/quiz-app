import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required Map<String, String> answerTexts,
    required Map<String, bool> correctAnswers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) {
  final answerTexts = <String, String>{};
  final correctAnswers = <String, bool>{};

  for (var i = 'a'.codeUnitAt(0); i <= 'f'.codeUnitAt(0); i++) {
    final key = 'answer_${String.fromCharCode(i)}';
    final value = json['answers']?[key];
    
    
    if (value != null && value.toString().isNotEmpty) {
      answerTexts[key] = value.toString();
    }
  }
 
  for (final key in answerTexts.keys) {
    final correctKey = '${key}_correct';
    final value = json['correct_answers']?[correctKey];
    
    correctAnswers[key] = value == 'true' || value == true;
  }

  return Question(
    id: json['id'] as int? ?? 0,
    question: json['question'] as String? ?? '',
    answerTexts: answerTexts,
    correctAnswers: correctAnswers,
  );
}
}
