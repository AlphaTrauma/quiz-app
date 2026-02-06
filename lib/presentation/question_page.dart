import 'package:flutter/material.dart';
import 'package:quizapp/app/router/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/domain/models/question.dart';
import 'package:quizapp/providers/user_provider.dart';
import 'package:quizapp/presentation/widgets/answer_button.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> questions;
  final String categoryName;

  const QuestionPage({
    super.key,
    required this.questions,
    this.categoryName = '',
  });

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentIndex = 0;
  int _correctCount = 0;
  String? _selectedAnswerKey;

  void _selectAnswer(String answerKey) {
    setState(() {
      _selectedAnswerKey = answerKey;
      final isCorrect =
          widget.questions[_currentIndex].correctAnswers[answerKey] == true;
      if (isCorrect) _correctCount++;
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (_currentIndex < widget.questions.length - 1) {
        setState(() {
          _currentIndex++;
          _selectedAnswerKey = null;
        });
      } else {
        final provider = UserProvider.maybeOf(context);
        if (provider != null) {
          provider.statsService.saveQuizResult(
            widget.categoryName,
            _correctCount,
            widget.questions.length,
          );
        }

        context.go(resultRoute, extra: _correctCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentIndex];
    final answerEntries = question.answerTexts.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context).question} ${_currentIndex + 1}/${widget.questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...answerEntries.map((entry) {
              final key = entry.key;
              final text = entry.value;
              final isSelected = _selectedAnswerKey == key;
              final isCorrect = question.correctAnswers[key] == true;

              return AnswerButton(
                text: text,
                isSelected: isSelected,
                isCorrect: isCorrect,
                onPressed: _selectedAnswerKey == null
                    ? () => _selectAnswer(key)
                    : null,
              );
            }),
          ],
        ),
      ),
    );
  }
}
