import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/core/base/failure.dart';
import 'package:template/core/base/result.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/domain/usecase/email_verified_usecase.dart';

part 'email_verified_notifier.g.dart';

@riverpod
EmailVerifiedUsecase _emailVerifiedUsecase(_EmailVerifiedUsecaseRef ref) {
  return EmailVerifiedUsecase(
    authRepository: ref.watch(authRepositoryProvider),
    localStorage: ref.watch(localStorageProvider),
  );
}

@riverpod
class EmailVerifiedNotifier extends _$EmailVerifiedNotifier {
  late final EmailVerifiedUsecase emailVerifiedUsecase;

  @override
  FutureOr<EmailVerifiedEntity?> build() {
    emailVerifiedUsecase = ref.watch(_emailVerifiedUsecaseProvider);
    return null;
  }

  Future<void> verifyEmail({required String otp}) async {
    state = const AsyncLoading();
    final result = await emailVerifiedUsecase.execute(otp: otp);

    if (result is Success) {
      state = AsyncData((result as Success).data);
      return;
    } else if (result is FailureResult) {
      final error = (result as FailureResult).error as Failure;
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.fromString("No trace Found"),
      );
    }
  }
}
