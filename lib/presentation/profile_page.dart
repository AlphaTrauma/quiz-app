import 'package:flutter/material.dart'; 
import 'package:quizapp/providers/user_provider.dart';
import 'package:quizapp/domain/stats_service.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<int, CategoryStats>> _statsFuture;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (!_isInitialized) {
      _statsFuture = UserProvider.of(context).statsService.loadAllCategoryStats();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).profile)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).profile)),
      body: FutureBuilder<Map<int, CategoryStats>>(
        future: _statsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).errorMessage}: ${snapshot.error}',
              ),
            );
          }

          final statsMap = snapshot.data!;
          if (statsMap.isEmpty) {
            return Center(child: Column(
              children: [
                Text(AppLocalizations.of(context).noData),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () => context.go('/'), child: Text(AppLocalizations.of(context).back))
              ]
            ));
          }

          return ListView.builder(
            itemCount: statsMap.length,
            itemBuilder: (context, index) {
              final entry = statsMap.entries.elementAt(index);
              final categoryId = entry.key;
              final stats = entry.value;
              return ListTile(
                title: Text('${AppLocalizations.of(context).category} $categoryId'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${AppLocalizations.of(context).completed}: ${stats.quizzes}'),
                    Text('${AppLocalizations.of(context).correct}: ${stats.totalCorrect}/${stats.totalAnswered}'),
                    Text('${AppLocalizations.of(context).accuracy}: ${(stats.accuracy * 100).toStringAsFixed(1)}%'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}