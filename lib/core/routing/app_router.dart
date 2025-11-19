import 'dart:async';

import 'package:aivolve/core/features/auth/presentation/providers/auth_providers.dart';
import 'package:aivolve/core/features/auth/presentation/screens/login_screen.dart';
import 'package:aivolve/core/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:aivolve/core/features/home/presentation/screens/home_screen.dart';
import 'package:aivolve/core/features/splash/presentation/screens/splash.dart';
import 'package:aivolve/core/routing/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      // Notify GoRouter to re-run redirect logic.
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepositoryProvider).authState,
    ),
    redirect: (context, state) {
      final user = ref.read(authStateProvider).value;
      final currentPath = state.uri.toString();

      /// Auth is loading -> stay on splash
      if (ref.read(authStateProvider).isLoading) {
        return AppRoutes.splash;
      }

      // Allow access to login and sign up routes when not logged in
      final publicRoutes = [AppRoutes.login, AppRoutes.signUp];

      // User not logged in → redirect to login (except for public routes)
      if (user == null && !publicRoutes.contains(currentPath)) {
        return AppRoutes.login;
      }

      // User logged in → prevent going back to login/sign up
      if (user != null && publicRoutes.contains(currentPath)) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (_, __) => const HomeScreen(),
      ),
    ],
  );
});
