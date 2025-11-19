import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/sources/firebase_auth_source.dart';

part 'auth_providers.g.dart';

/// ---------------------------------------------------------------------------
///  FirebaseAuth Provider
/// ---------------------------------------------------------------------------
/// This provider exposes a singleton instance of FirebaseAuth.
///
/// WHY DO WE WRAP FIREBASEAUTH IN A PROVIDER?
/// - Enables Dependency Injection (DI) across the app.
/// - Allows replacing FirebaseAuth with a mock during testing.
/// - Prevents direct imports of FirebaseAuth across multiple layers.
/// - Keeps architecture clean: UI/Domain layers never touch external SDKs.
///
/// USAGE:
/// final auth = ref.watch(firebaseAuthProvider);
///
/// NOTE:
/// Never call FirebaseAuth.instance directly anywhere else in the codebase.
/// Always use this provider for consistency and testability.
/// ---------------------------------------------------------------------------
@riverpod
FirebaseAuth firebaseAuth(ref) {
  return FirebaseAuth.instance;
}

/// ---------------------------------------------------------------------------
///  FirebaseAuthSource Provider (Data Source Layer)
/// ---------------------------------------------------------------------------
/// This provider creates the FirebaseAuthSource, which is the lowest-level
/// data handler responsible for directly interacting with FirebaseAuth.
///
/// WHY THIS PROVIDER?
/// - Keeps Firebase SDK usage restricted to the data source layer.
/// - Makes the data source fully testable (can inject a mock FirebaseAuth).
/// - Ensures a single instance of FirebaseAuthSource is reused.
///
/// USAGE:
/// final source = ref.watch(firebaseAuthSourceProvider);
///
/// NOTE:
/// Higher layers (repository, controllers) depend on this provider.
/// UI should **never** import or use FirebaseAuthSource directly.
/// ---------------------------------------------------------------------------
@riverpod
FirebaseAuthSource firebaseAuthSource(ref) {
  return FirebaseAuthSource(ref.watch(firebaseAuthProvider));
}

/// ---------------------------------------------------------------------------
///  AuthRepository Provider (Repository Layer)
/// ---------------------------------------------------------------------------
/// The repository acts as the bridge between the data sources and the domain
/// or presentation layers. It provides clean, abstracted methods for auth.
///
/// WHY THIS PROVIDER?
/// - Allows swapping implementations (e.g., LocalAuth, MockAuth).
/// - Domain/UI layers never need to know what data source is used.
/// - All logic for signIn/signOut/authState flows through here.
///
/// USAGE:
/// final repo = ref.watch(authRepositoryProvider);
///
/// NOTE:
/// This is the main dependency consumed by controllers and providers.
/// ---------------------------------------------------------------------------
@riverpod
AuthRepository authRepository(ref) {
  return AuthRepository(ref.watch(firebaseAuthSourceProvider));
}

/// ---------------------------------------------------------------------------
///  Auth State Provider (Stream&lt;User?&gt;)
/// ---------------------------------------------------------------------------
/// Exposes the Firebase authentication user stream across the app.
///
/// WHY THIS PROVIDER?
/// - Central point of truth for login/logout state.
/// - Enables reactive routing (GoRouter redirect if user = null).
/// - Simplifies listening to auth status in UI or controllers.
///
/// USAGE:
/// ref.watch(authStateProvider); returns Stream&lt;User?&gt;
///
/// NOTE:
/// This should be used only to *read* the user state, not to trigger actions.
/// All mutation (sign-in/out) must go through AuthRepository.
/// ---------------------------------------------------------------------------
@riverpod
Stream<User?> authState(ref) {
  return ref.watch(authRepositoryProvider).authState;
}