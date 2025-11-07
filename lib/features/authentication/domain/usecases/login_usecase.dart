import 'package:template/features/authentication/data/models/login_response.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email or password cannot be empty");
    }

    final response = await repository.login(email, password);

    // Business rules go here
    // await storage.saveToken(response.token);
    // analytics.logEvent('login_success', {'email': email});

    return response;
  }
}
