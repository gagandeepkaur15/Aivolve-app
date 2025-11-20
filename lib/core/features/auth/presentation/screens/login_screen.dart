import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/routing/app_routes.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_controllers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final controller = ref.read(loginControllerProvider.notifier);
    await controller.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (mounted) {
      final state = ref.read(loginControllerProvider);
      if (state.hasError) {
        // Show error message
        final errorMessage = _getErrorMessage(state.error);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      }
      // Success handling is done by router redirect based on auth state
    }
  }

  String _getErrorMessage(Object? error) {
    final errorString = error.toString().toLowerCase();
    if (errorString.contains('user-not-found')) {
      return 'No account found with this email.';
    } else if (errorString.contains('wrong-password')) {
      return 'Incorrect password. Please try again.';
    } else if (errorString.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    } else if (errorString.contains('user-disabled')) {
      return 'This account has been disabled.';
    } else if (errorString.contains('too-many-requests')) {
      return 'Too many failed attempts. Please try again later.';
    } else if (errorString.contains('network-request-failed')) {
      return 'Network error. Please check your connection.';
    }
    return 'An error occurred. Please try again.';
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginControllerProvider);
    final isLoading = loginState.isLoading;
    return Scaffold(
      body: SafeArea(
        child: AivolveBackground(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'Welcome Back!',
                      style: AivolveTextStyles.heading,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: AivolveTextStyles.subHeading,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      enabled: !isLoading,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: AivolveColors.lightBlue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      enabled: !isLoading,
                      onFieldSubmitted: (_) => _handleLogin(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: AivolveColors.lightBlue,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),

                    // Login Button
                    SizedBox(
                      height: 50,
                      child: PrimaryButton(
                        onPressed: () {
                          isLoading ? null : _handleLogin;
                        },
                        text: 'Login',
                        isLoading: isLoading,
                      ),
                    ),
                    const SizedBox(height: 3),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () => context.go(AppRoutes.signUp),
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Image(image: AssetImage("assets/login_bot.png")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
