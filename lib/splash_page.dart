import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/config/router/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'label': 'Sign In Page', 'route': AppRoutes.signIn},
      {'label': 'Sign Up Page', 'route': AppRoutes.signUp},
      {'label': 'Forgot Password', 'route': AppRoutes.forgotPassword},
      {'label': 'Email Verification', 'route': AppRoutes.emailVerification},
      {'label': 'OTP Verification', 'route': AppRoutes.otpVerification},
      {'label': 'Reset Password', 'route': AppRoutes.resetPassword},
      {'label': 'Analytics Test', 'route': AppRoutes.home},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(24),
          shrinkWrap: true,
          itemCount: buttons.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = buttons[index];
            return ElevatedButton(
              onPressed: () => context.push(item['route']!),
              child: Text(item['label']!, style: const TextStyle(fontSize: 18)),
            );
          },
        ),
      ),
    );
  }
}
