import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/data/models/login_response.dart';
import 'package:template/features/authentication/data/repositories/auth_repository.dart';
import 'package:template/features/authentication/domain/usecases/login_usecase.dart';
import 'package:template/features/authentication/presentation/notifiers/auth_notifier.dart';

// 🔹 Repository Provider
final authRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider); // directly from core
  return AuthRepository(api);
});

// 🔹 UseCase Provider
final loginUseCaseProvider = Provider((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUseCase(repo);
});

// 🔹 Notifier Provider
final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<LoginResponse?>>((ref) {
      final usecase = ref.watch(loginUseCaseProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      return AuthNotifier(usecase, apiService, snackbarService);
    });
