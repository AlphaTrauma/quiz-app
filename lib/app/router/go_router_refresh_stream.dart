import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension GoRouterRefreshStream on GoRouter {
  void refreshAuthStream(Stream<User?> stream) {
    stream.listen((user) {
      if (user == null && !canPop()) {
        go('/login');
      } else if (user != null && canPop()) {
        go('/');
      }
    });
  }
}