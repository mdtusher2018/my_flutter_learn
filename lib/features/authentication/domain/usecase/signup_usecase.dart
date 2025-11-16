// domain/usecases/signup_usecase.dart

import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';

class SignupUseCase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  SignupUseCase({required this.localStorage, required this.authRepository});

  Future<SignupEntity> execute({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    email = email.trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    // 🔹 Validation
    if (email.isNullOrEmpty && password.isNullOrEmpty) {
      throw Exception("Please enter your email and password.");
    }

    if (email.isNullOrEmpty) {
      throw Exception("Email cannot be empty.");
    }

    if (email.isInvalidEmail) {
      throw Exception("Please enter a valid email address.");
    }

    if (password.isNullOrEmpty) {
      throw Exception("Password cannot be empty.");
    }

    if (password.isInvalidPassword) {
      throw Exception("Password must be 6–16 characters long.");
    }

    if (confirmPassword != password) {
      throw Exception("Password and confirm password do not match.");
    }

    // 🔹 Call repository (API)
    final response = await authRepository.signup(email, password);

    final signupEntity = SignupEntity(signUpToken: response.data!.signUpToken);

    // 🔹 Save token locally
    await localStorage.saveKey(
      StorageKey.accessToken,
      signupEntity.signUpToken,
    );

    return signupEntity;
  }
}
