// domain/usecases/signup_usecase.dart

import 'package:template/core/base/failure.dart';
import 'package:template/core/base/result.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';
import 'package:template/features/authentication/data/models/sign_up/signup_response.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';

class SignupUseCase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  SignupUseCase({required this.localStorage, required this.authRepository});

  Future<Result<SignupEntity, Failure>> execute({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    email = email.trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    // 🔹 Validation
    if (email.isNullOrEmpty && password.isNullOrEmpty) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter your email and password.",
        ),
      );
    }

    if (email.isNullOrEmpty) {
      return FailureResult(
        Failure(type: FailureType.unknown, message: "Email cannot be empty."),
      );
    }

    if (email.isInvalidEmail) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Please enter a valid email address.",
        ),
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

    if (password.isInvalidPassword) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password must be 6–16 characters long.",
        ),
      );
    }

    if (confirmPassword != password) {
      return FailureResult(
        Failure(
          type: FailureType.unknown,
          message: "Password and confirm password do not match.",
        ),
      );
    }

    // 🔹 Call repository (API)
    final response = await authRepository.signup(email, password);
    if (response is FailureResult) {
      return FailureResult((response as FailureResult).error);
    }

    final signupEntity = SignupEntity(
      signUpToken:
          ((response as Success).data! as SignupResponse).data.signUpToken,
    );

    // 🔹 Save token locally
    await localStorage.saveKey(
      StorageKey.accessToken,
      signupEntity.signUpToken,
    );

    return Success(signupEntity);
  }
}
