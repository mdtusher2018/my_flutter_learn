import 'package:template/features/authentication/data/models/login_response.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(String email, String password);
}
