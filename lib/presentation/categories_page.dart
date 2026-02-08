import 'package:flutter/material.dart';
import 'package:quizapp/app/router/routes/app_routes.dart';
import 'package:quizapp/domain/models/category.dart';
import 'package:quizapp/domain/quiz_service.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Future<List<Category>> _categoriesFuture;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _categoriesFuture = QuizService().fetchCategories();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).categories)),
      body: FutureBuilder<List<Category>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final cat = snapshot.data![index];
                return ListTile(
                  title: Text(cat.name),
                  onTap: () async {
                    final questions = await QuizService().fetchQuestions(
                      cat.name,
                      10,
                    );
                    if (context.mounted) {
                      context.go(
                        questionRoute,
                        extra: {
                          'questions': questions,
                          'categoryName': cat.name,
                        },
                      );
                    }
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppLocalizations.of(context).errorMessage}: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => context.go('/'),
                        icon: const Icon(Icons.arrow_back),
                        label: Text(
                          AppLocalizations.of(context).back,
                          style: const TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _categoriesFuture = QuizService().fetchCategories();
                          });
                        },
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          AppLocalizations.of(context).tryAgain,
                          style: const TextStyle(fontSize: 16),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
