import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).home),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user?.email != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  '${AppLocalizations.of(context).loggedAs} ${user!.email}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ElevatedButton(
              onPressed: () => context.go('/categories'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: Text(AppLocalizations.of(context).start),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => context.go('/profile'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: Text(AppLocalizations.of(context).profile),
            ),
            const SizedBox(height: 16),

            OutlinedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
                side: const BorderSide(color: Colors.red),
              ),
              child: Text(
                AppLocalizations.of(context).signOut,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
