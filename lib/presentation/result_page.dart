import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;

  const ResultPage({super.key, required this.correctCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).result)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${AppLocalizations.of(context).correctAnswers}: $correctCount',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/categories'),
              child: Text(AppLocalizations.of(context).tryAgain),
            ),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text(AppLocalizations.of(context).home),
            ),
          ],
        ),
      ),
    );
  }
}
