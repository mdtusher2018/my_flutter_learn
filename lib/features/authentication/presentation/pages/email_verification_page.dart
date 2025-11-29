import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/config/router/routes.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/presentation/notifiers/email_verified_notifier.dart';

class EmailVerificationPage extends ConsumerStatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  ConsumerState<EmailVerificationPage> createState() =>
      _EmailVerificationPageState();
}

class _EmailVerificationPageState extends ConsumerState<EmailVerificationPage> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _verifyEmail() {
    ref
        .read(emailVerifiedNotifierProvider.notifier)
        .verifyEmail(otp: _codeController.text.trim());
  }

  @override
  void initState() {
    super.initState();
    ref.listenManual<AsyncValue<EmailVerifiedEntity?>>(
      emailVerifiedNotifierProvider,
      (prev, next) {
        next.whenData((success) {
          if (success != null) {
            context.go(AppRoutes.home);
          }
        });

        next.whenOrNull(
          error: (error, stackTrace) {
            (ref.read(
              snackBarServiceProvider,
            )).showError(error.toString(), context: context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailVerifiedNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Verify Your Email")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Enter the verification code sent to your email."),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Verification Code",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            state.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _verifyEmail,
                    child: const Text("Verify"),
                  ),
          ],
        ),
      ),
    );
  }
}
