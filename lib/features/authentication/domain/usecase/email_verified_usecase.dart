import 'package:template/core/base/failure.dart';
import 'package:template/core/base/result.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';
import 'package:template/features/authentication/data/models/email_verification/email_verified_response.dart';

import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class EmailVerifiedUsecase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  EmailVerifiedUsecase({
    required this.authRepository,
    required this.localStorage,
  });

  Future<Result<EmailVerifiedEntity, Failure>> execute({
    required String otp,
  }) async {
    if (otp.isNullOrEmpty) {
      return FailureResult(
        Failure(type: FailureType.unknown, message: "OTP is required"),
      );
    }

    final response = await authRepository.emailVerification(otp);

    if (response is FailureResult) {
      return FailureResult((response as FailureResult).error);
    }

    final emailVerifiedEntity = EmailVerifiedEntity(
      accessToken: ((response as Success).data as EmailVerifiedResponse)
          .data
          .accessToken,
    );

    localStorage.saveKey(
      StorageKey.accessToken,
      emailVerifiedEntity.accessToken,
    );

    return Success(emailVerifiedEntity);
  }
}
