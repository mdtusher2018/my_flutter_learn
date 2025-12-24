import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/core/analytics_and_crashlytics/analytics/analytics_observer.dart';
import 'package:template/src/features/authentication/presentation/pages/email_verification_page.dart';
import 'package:template/src/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:template/src/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:template/src/features/authentication/presentation/pages/signin_page.dart';
import 'package:template/src/features/authentication/presentation/pages/signup_page.dart';
import 'package:template/src/features/profile/presentation/page/profile_page.dart';
import 'package:template/unorganized_files/graph_ql/country_page.dart';
import 'package:template/unorganized_files/protos/protobuf_service.dart';
import 'package:template/unorganized_files/all_page.dart';

import '../../../unorganized_files/home_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final analytics = FirebaseAnalytics.instance;
  return GoRouter(
    initialLocation: AppRoutes.countryPage,
    observers: [AppAnalyticsObserver(analytics)],
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => Allpage()),

      GoRoute(path: AppRoutes.allpage, builder: (context, state) => Allpage()),

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

      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.wellcome,
        builder: (context, state) => WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.countryPage,
        builder: (context, state) => CountryPage(),
      ),
    ],
  );
});
