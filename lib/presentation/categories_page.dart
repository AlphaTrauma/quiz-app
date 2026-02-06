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

  @override
  void initState() {
    super.initState();
    _categoriesFuture = QuizService().fetchCategories();
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
                      3,
                    );
                    context.go(
                      questionRoute,
                      extra: {'questions': questions, 'categoryName': cat.name},
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).errorMessage}: ${snapshot.error}',
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
