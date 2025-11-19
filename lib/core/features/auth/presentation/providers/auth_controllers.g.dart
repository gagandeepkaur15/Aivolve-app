// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(LoginController)
const loginControllerProvider = LoginControllerProvider._();

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
final class LoginControllerProvider
    extends $AsyncNotifierProvider<LoginController, void> {
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
  const LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  LoginController create() => LoginController();
}

String _$loginControllerHash() => r'55635abeccf3524899c51300284faf431ed7229e';

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

abstract class _$LoginController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
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

@ProviderFor(SignUpController)
const signUpControllerProvider = SignUpControllerProvider._();

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
final class SignUpControllerProvider
    extends $AsyncNotifierProvider<SignUpController, void> {
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
  const SignUpControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpControllerHash();

  @$internal
  @override
  SignUpController create() => SignUpController();
}

String _$signUpControllerHash() => r'00efe49db6d2b051b7df0ac34fc8d6e157901912';

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

abstract class _$SignUpController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
