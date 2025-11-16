import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/features/authentication/presentation/pages/email_verification_page.dart';
import 'package:template/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:template/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:template/features/authentication/presentation/pages/signin_page.dart';
import 'package:template/features/authentication/presentation/pages/signup_page.dart';
import 'package:template/splash_page.dart';

import '../../home_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: AppRoutes.emailVerification,
        builder: (context, state) => EmailVerificationPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (context, state) => OtpVerificationPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
});
