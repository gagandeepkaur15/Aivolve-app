import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_controllers.dart';
import '../../../../routing/app_routes.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final controller = ref.read(signUpControllerProvider.notifier);
    await controller.signUp(
      _firstName.text.trim(),
      _lastName.text.trim(),
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (mounted) {
      final state = ref.read(signUpControllerProvider);
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
    if (errorString.contains('email-already-in-use')) {
      return 'An account already exists with this email.';
    } else if (errorString.contains('weak-password')) {
      return 'Password is too weak. Please use a stronger password.';
    } else if (errorString.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    } else if (errorString.contains('operation-not-allowed')) {
      return 'Sign up is currently disabled.';
    } else if (errorString.contains('network-request-failed')) {
      return 'Network error. Please check your connection.';
    }
    return 'An error occurred. Please try again.';
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpControllerProvider);
    final isLoading = signUpState.isLoading;

    return Scaffold(
      body: SafeArea(
        child: AivolveBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 50.h,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Create Your Account',
                              style: AivolveTextStyles.heading,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Create your account to access all features',
                              style: AivolveTextStyles.subHeading,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 48.h),

                            // Name fields
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _firstName,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    enabled: !isLoading,
                                    decoration: InputDecoration(
                                      hintText: 'First Name',

                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: AivolveColors.lightBlue,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Expanded(
                                  child: TextFormField(
                                    controller: _lastName,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    enabled: !isLoading,
                                    decoration: InputDecoration(
                                      hintText: 'Last Name',
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: AivolveColors.lightBlue,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),

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
                              textInputAction: TextInputAction.next,
                              enabled: !isLoading,
                              decoration: InputDecoration(
                                hintText: 'Password',
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
                                  return 'Please enter a password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),

                            // Confirm Password Field
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmPassword,
                              textInputAction: TextInputAction.done,
                              enabled: !isLoading,
                              onFieldSubmitted: (_) => _handleSignUp(),
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AivolveColors.lightBlue,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirmPassword =
                                          !_obscureConfirmPassword;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const Spacer(),

                            // Sign Up Button
                            SizedBox(
                              child: PrimaryButton(
                                onPressed: () {
                                  isLoading ? null : _handleSignUp();
                                },
                                text: 'Sign Up',
                                isLoading: isLoading,
                              ),
                            ),
                            SizedBox(height: 15.h),

                            // Login Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: AivolveTextStyles.paragraph,
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: isLoading
                                      ? null
                                      : () => context.go(AppRoutes.onboarding),
                                  child: Text(
                                    'Login',
                                    style: AivolveTextStyles.paragraph.copyWith(
                                      color: AivolveColors.lightBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
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
