import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/core/base/failure.dart';
import 'package:template/core/base/result.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';
import 'package:template/features/authentication/domain/usecase/signup_usecase.dart';
part 'signup_notifier.g.dart';

@riverpod
SignupUseCase _signupUseCase(_SignupUseCaseRef ref) {
  return SignupUseCase(
    localStorage: ref.watch(localStorageProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}

@riverpod
class SignupNotifier extends _$SignupNotifier {
  late final SignupUseCase signupUseCase;

  @override
  FutureOr<SignupEntity?> build() {
    signupUseCase = ref.watch(_signupUseCaseProvider);
    return null;
  }

  Future<void> signup({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncLoading();

    final result = await signupUseCase.execute(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (result is Success) {
      state = AsyncData((result as Success).data);
      return;
    } else if (result is FailureResult) {
      final Failure error = (result as FailureResult).error;
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.fromString("No trace found"),
      );
    }

    return;
  }
}
