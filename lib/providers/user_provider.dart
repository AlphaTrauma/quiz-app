import 'package:flutter/material.dart';
import 'package:quizapp/domain/auth_service.dart';
import 'package:quizapp/domain/stats_service.dart';

class UserProvider extends InheritedWidget {
  final AuthService authService;
  final StatsService statsService;

  UserProvider({super.key, required super.child})
    : authService = AuthService(),
      statsService = StatsService();

  static UserProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  static UserProvider of(BuildContext context) {
    final provider = maybeOf(context);
    assert(provider != null, 'No UserProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) => false;
}
