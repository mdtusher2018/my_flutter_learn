import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/data/models/login_response.dart';
import 'package:template/features/authentication/domain/usecases/login_usecase.dart';

class AuthNotifier extends BaseAsyncNotifier<LoginResponse> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase, super.apiService, super.snackBarService);

  Future<void> login(String email, String password) async {
    await execute(
      () => loginUseCase(email, password),
      showSuccess: true,
      successMessage: "Login successful",
    );
  }
}
