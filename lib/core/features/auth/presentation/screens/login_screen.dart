import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/routing/app_routes.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: AivolveBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 60.h),
                            Text(
                              'Welcome Back!',
                              style: AivolveTextStyles.heading,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Sign in to continue',
                              style: AivolveTextStyles.subHeading,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 48.h),

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
                                if (!value.contains('@') ||
                                    !value.contains('.')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),

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
                            SizedBox(height: 50.h),

                            // Login Button
                            SizedBox(
                     
                              child: PrimaryButton(
                                onPressed: () {
                                  isLoading ? null : _handleLogin();
                                },
                                text: 'Login',
                                isLoading: isLoading,
                              ),
                            ),
                            SizedBox(height: 15.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: AivolveTextStyles.paragraph,
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: isLoading
                                      ? null
                                      : () => context.go(AppRoutes.signUp),
                                  child: Text(
                                    'Sign Up',
                                    style: AivolveTextStyles.paragraph.copyWith(
                                      color: AivolveColors.lightBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 250.h,
                              width: 250.w,
                              child: Image(
                                image: AssetImage("assets/login_bot.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
