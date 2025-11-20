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
      ref.watch(authStateProvider).when(
        data: (_) => Stream.value(null),
        loading: () => Stream.value(null),
        error: (_, __) => Stream.value(null),
      ),
    ),
    redirect: (context, state) {
      final authState = ref.watch(authStateProvider);
      final currentPath = state.uri.toString();

      // Routes that do NOT require login
      final publicRoutes = [
        AppRoutes.login,
        AppRoutes.signUp,
        AppRoutes.splash,
      ];

      // While auth state is still loading, stay on splash screen
      if (authState.isLoading) {
        if (currentPath != AppRoutes.splash) {
          return AppRoutes.splash;
        }
        return null;
      }

      // If there was an error loading auth state, go to login
      if (authState.hasError) {
        return AppRoutes.login;
      }

      final user = authState.value;

      // Auth has finished loading with no user → redirect to login (unless already there)
      if (user == null && currentPath == AppRoutes.splash) {
        return AppRoutes.login;
      }

      // If user is NOT logged in → block protected routes
      if (user == null && !publicRoutes.contains(currentPath)) {
        return AppRoutes.login;
      }

      // If user IS logged in → prevent access to login/splash/sign-up
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