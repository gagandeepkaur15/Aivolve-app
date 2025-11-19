// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(firebaseAuth)
const firebaseAuthProvider = FirebaseAuthProvider._();

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

final class FirebaseAuthProvider
    extends $FunctionalProvider<FirebaseAuth, FirebaseAuth, FirebaseAuth>
    with $Provider<FirebaseAuth> {
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
  const FirebaseAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseAuth create(Ref ref) {
    return firebaseAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuth>(value),
    );
  }
}

String _$firebaseAuthHash() => r'cff15592c2b2540ecca81d6450d8034b91548302';

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

@ProviderFor(firebaseAuthSource)
const firebaseAuthSourceProvider = FirebaseAuthSourceProvider._();

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

final class FirebaseAuthSourceProvider
    extends
        $FunctionalProvider<
          FirebaseAuthSource,
          FirebaseAuthSource,
          FirebaseAuthSource
        >
    with $Provider<FirebaseAuthSource> {
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
  const FirebaseAuthSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseAuthSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthSourceHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuthSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseAuthSource create(Ref ref) {
    return firebaseAuthSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuthSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuthSource>(value),
    );
  }
}

String _$firebaseAuthSourceHash() =>
    r'25be672bcd9c1a175a9eb7b08c54bfa92c3db7af';

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

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

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

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
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
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'32e2769e1d5f3aa9c787d253d98b16ceee11f4da';

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

@ProviderFor(authState)
const authStateProvider = AuthStateProvider._();

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

final class AuthStateProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
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
  const AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return authState(ref);
  }
}

String _$authStateHash() => r'8f6439d52f0f10b8651daeb4794551d6bd0c68a9';
