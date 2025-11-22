import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_providers.dart';

part 'auth_controllers.g.dart';

/// ---------------------------------------------------------------------------
///  Login Controller (Presentation Layer)
/// ---------------------------------------------------------------------------
/// Handles login form state and business logic for user authentication.
///
/// WHY THIS CONTROLLER?
/// - Separates UI logic from business logic (clean architecture).
/// - Manages form validation, loading states, and error handling.
/// - UI layer only handles presentation, controller handles interaction.
///
/// USAGE:
/// final controller = ref.read(loginControllerProvider.notifier);
/// controller.login(email, password);
/// final state = ref.watch(loginControllerProvider);
/// ---------------------------------------------------------------------------
@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      await repository.login(email, password);
      // Navigation is handled by router redirect logic based on auth state
    });
  }
}

/// ---------------------------------------------------------------------------
///  Sign Up Controller (Presentation Layer)
/// ---------------------------------------------------------------------------
/// Handles sign up form state and business logic for user registration.
///
/// WHY THIS CONTROLLER?
/// - Separates UI logic from business logic (clean architecture).
/// - Manages form validation, loading states, and error handling.
/// - UI layer only handles presentation, controller handles interaction.
///
/// USAGE:
/// final controller = ref.read(signUpControllerProvider.notifier);
/// controller.signUp(email, password);
/// final state = ref.watch(signUpControllerProvider);
/// ---------------------------------------------------------------------------
@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() {}

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      await repository.register(firstName, lastName, email, password);
      // Navigation is handled by router redirect logic based on auth state
    });
  }
}

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  FutureOr<void> build() {}

  Future<void> submitAnswers(Map<String, dynamic> answers) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final auth = ref.read(firebaseAuthProvider);
      final uid = auth.currentUser!.uid;
      await repo.completeOnboarding(uid, answers);
    });
  }
}
