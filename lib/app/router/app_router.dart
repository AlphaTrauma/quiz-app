import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizapp/domain/models/question.dart';
import 'package:quizapp/app/router/go_router_refresh_stream.dart';
import 'package:quizapp/app/router/routes/app_routes.dart';
import 'package:quizapp/presentation/categories_page.dart';
import 'package:quizapp/presentation/home_page.dart';
import 'package:quizapp/presentation/login_page.dart';
import 'package:quizapp/presentation/profile_page.dart';
import 'package:quizapp/presentation/question_page.dart';
import 'package:quizapp/presentation/register_page.dart';
import 'package:quizapp/presentation/result_page.dart'; 
import 'package:quizapp/presentation/stat_page.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: homeRoute,
      refreshListenable: AuthStateChangeStream(),
      routes: [
        GoRoute(path: homeRoute, builder: (context, state) => const HomePage()),
        GoRoute(
          path: loginRoute,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: registerRoute,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: categoriesRoute,
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          path: questionRoute,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            final questions = (data['questions'] as List).cast<Question>();
            final categoryName = data['categoryName'] as String;
            return QuestionPage(
              questions: questions,
              categoryName: categoryName,
            );
          },
        ),

        GoRoute(
          path: resultRoute,
          builder: (context, state) {
            final correctCount = state.extra as int;
            return ResultPage(correctCount: correctCount);
          },
        ),
        GoRoute(
          path: profileRoute,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(path: statRoute, builder: (context, state) => const StatPage()),
      ],
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        final isLoggedIn = user != null;
        final isAuthPage =
            state.uri.toString().startsWith('/login') ||
            state.uri.toString().startsWith('/register');

        if (!isLoggedIn && !isAuthPage) {
          return loginRoute;
        }
        if (isLoggedIn && isAuthPage) {
          return homeRoute;
        }
        return null;
      },
    );

    router.refreshAuthStream(FirebaseAuth.instance.authStateChanges());
  }
}

class AuthStateChangeStream extends ChangeNotifier {
  StreamSubscription<User?>? _subscription;

  AuthStateChangeStream() {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
