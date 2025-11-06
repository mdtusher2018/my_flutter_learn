import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/riverpod/base_async_notifier.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/providers.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/login/login_response.dart';

//=========== Provider =================
final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginResponse?>>((ref) {
      final apiService = ref.read(apiServiceProvider);
      final snackBarService = ref.read(snackBarServiceProvider);
      return LoginNotifier(apiService,snackBarService);
    });





class LoginNotifier extends BaseAsyncNotifier<LoginResponse> {
  late final AuthRepository _repo;

  LoginNotifier(super.apiService, super.snackBarService) {
    _repo = AuthRepository(apiService);
  }

  Future<void> login(String email, String password) async {
    await execute(() => _repo.login(email, password));
  }
}

class AuthRepository {
  final IApiService api;
  AuthRepository(this.api);

  Future<LoginResponse> login(String email, String password) async {
    final res = await api.post(ApiEndpoints.signin, {
      "email": email,
      "password": password,
    });

    return LoginResponse.fromJson(res);
  }
}
