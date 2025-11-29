import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/core/services/network/api_client.dart';
import 'package:template/core/services/network/api_service.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/authentication/data/repositories/auth_repository.dart';
import 'package:template/features/authentication/domain/entites/forgot_password_entity.dart';
import 'package:template/features/authentication/domain/entites/otp_verified_entity.dart';
import 'package:template/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:template/features/authentication/domain/usecase/otp_verified_usecase.dart';
import 'package:template/features/authentication/presentation/notifiers/forgot_password_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/otp_verified_notifier.dart';

part 'providers.g.dart';

// Provide LocalStorageService
@riverpod
ILocalStorageService localStorage(LocalStorageRef ref) {
  return LocalStorageService();
}

// Provide ApiClient
@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final localService = ref.watch(localStorageProvider);
  return ApiClient(baseUrl: ApiEndpoints.baseUrl, localStorage: localService);
}

// Provide ApiService
@riverpod
IApiService apiService(ApiServiceRef ref) {
  final client = ref.watch(apiClientProvider);
  return ApiService(client, baseUrl: ApiEndpoints.baseUrl);
}

// Provide SnackbarService
@riverpod
ISnackBarService snackBarService(SnackBarServiceRef ref) {
  return SnackBarService();
}

//=============== auththentication=================
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final api = ref.watch(apiServiceProvider);
  return AuthRepository(api);
}

final forgotPasswordProvider =
    StateNotifierProvider<
      ForgotPasswordNotifier,
      AsyncValue<ForgotPasswordEntity?>
    >((ref) {
      final localStorage = ref.watch(localStorageProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      final authRepository = ref.watch(authRepositoryProvider);
      final forgotPasswordUseCase = ForgotPasswordUsecase(
        authRepository: authRepository,
        localStorageService: localStorage,
      );

      return ForgotPasswordNotifier(
        apiService,
        snackbarService,
        forgotPasswordUsecase: forgotPasswordUseCase,
      );
    });

final otpVerificationProvider =
    StateNotifierProvider<OTPVerifiedNotifier, AsyncValue<OTPVerifiedEntity?>>((
      ref,
    ) {
      final localStorage = ref.watch(localStorageProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      final authRepository = ref.watch(authRepositoryProvider);
      final otpVerifiedUseCase = OTPVerifiedUsecase(
        authRepository: authRepository,
        localStorage: localStorage,
      );

      return OTPVerifiedNotifier(
        apiService,
        snackbarService,
        otpVerifiedUsecase: otpVerifiedUseCase,
      );
    });
