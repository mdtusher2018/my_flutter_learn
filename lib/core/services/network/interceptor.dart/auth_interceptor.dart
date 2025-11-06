// lib/core/network/interceptors/auth_interceptor.dart
import 'package:dio/dio.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';

class AuthInterceptor extends Interceptor {
  final ILocalStorageService _localStorage;

  AuthInterceptor(this._localStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final accessToken = await _localStorage.readKey(StorageKey.accessToken) as String?;

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      options.headers['Accept-Language'] = 'en';
    } catch (e, st) {
      Logger.error("AuthInterceptor error: $e\n$st");
    }

    return handler.next(options);
  }
}
