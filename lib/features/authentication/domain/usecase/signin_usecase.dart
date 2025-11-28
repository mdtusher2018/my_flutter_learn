// features/authentication/domain/usecases/login_usecase.dart

import 'package:template/core/base/failure.dart';
import 'package:template/core/base/result.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';
import 'package:template/features/authentication/data/models/sign_in/signin_response.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class SigninUseCase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  SigninUseCase({required this.authRepository, required this.localStorage});

  Future<Result<SigninEntity, Failure>> execute({
    required String email,
    required String password,
  }) async {
    email = email.trim();
    password = password.trim();

    // ---------------------------
    // 🔍 Input Validation
    // (Return Failure instead of throwing)
    // ---------------------------
    if (email.isNullOrEmpty && password.isNullOrEmpty) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter email & password.",
        ),
      );
    }

    if (email.isNullOrEmpty) {
      return FailureResult(
        Failure(type: FailureType.unknown, message: "Email cannot be empty."),
      );
    }

    if (password.isNullOrEmpty) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password cannot be empty.",
        ),
      );
    }

    if (email.isInvalidEmail) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter a valid email.",
        ),
      );
    }

    if (password.isInvalidPassword) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password must be 6–16 characters.",
        ),
      );
    }

    // ---------------------------
    // 🔥 Call repository
    // ---------------------------
    final result = await authRepository.login(email, password);

    // If repository returned Failure → return Failure
    if (result is FailureResult) {
      return FailureResult((result as FailureResult).error);
    }

    // ---------------------------
    // 🟢 Success path
    // ---------------------------
    final data = (result as Success).data;
    final entity = SigninEntity(
      accessToken: (data as SigninResponse).data.accessToken,
    );

    // Save token
    await localStorage.saveKey(StorageKey.accessToken, entity.accessToken);

    return Success(entity);
  }
}
