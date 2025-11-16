import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/config/router/routes.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/domain/entites/otp_verified_entity.dart';

class OtpVerificationPage extends ConsumerStatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  ConsumerState<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOtp() {
    final otp = _otpController.text.trim();

    ref.read(otpVerificationProvider.notifier).verifyOTP(otp: otp);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(otpVerificationProvider);

    ref.listen<AsyncValue<OTPVerifiedEntity?>>(otpVerificationProvider, (
      prev,
      next,
    ) {
      next.whenData((success) {
        if (success != null) {
          // Navigate to home on success
          context.go(AppRoutes.home);
        }
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the OTP sent to your phone or email.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP Code',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 24),
            state.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _verifyOtp,
                    child: const Text('Verify OTP'),
                  ),
                ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
