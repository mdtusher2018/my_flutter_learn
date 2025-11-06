// lib/core/network/interceptors/refresh_token_interceptor.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:template/core/utils/logger.dart';

import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/api_end_points.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final ILocalStorageService localStorage;

  bool _isRefreshing = false;
  final List<_QueuedRequest> _requestQueue = [];

  RefreshTokenInterceptor(this.dio, this.localStorage);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    if (response?.statusCode == 401 && !_isAuthRefreshCall(err)) {
      final requestOptions = err.requestOptions;

      // Queue request until refresh complete
      if (_isRefreshing) {
        final completer = Completer<Response>();
        _requestQueue.add(_QueuedRequest(requestOptions, completer));
        return handler.resolve(await completer.future);
      }

      _isRefreshing = true;

      try {
        final refreshToken = await localStorage.readKey(
          StorageKey.refreshToken,
        );

        if (refreshToken == null) {
          _forceLogout();
          return handler.next(err);
        }

        final newToken = await _refreshToken(refreshToken);

        if (newToken != null) {
          _updateQueuedRequestsWithNewToken(newToken);

          requestOptions.headers['Authorization'] = 'Bearer $newToken';
          final retryResponse = await dio.fetch(requestOptions);

          handler.resolve(retryResponse);
          return;
        }

        _forceLogout();
        handler.next(err);
      } catch (e, st) {
        Logger.error("Refresh interceptor error: $e\n$st");
        _forceLogout();
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }

      return;
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final refreshDio = Dio(); // avoid infinite loop

      final refreshResponse = await refreshDio.post(
        '${dio.options.baseUrl}/${ApiEndpoints.refreshToken}',
        data: {"refreshToken": refreshToken},
      );

      if (refreshResponse.statusCode == 200) {
        final newAccess = refreshResponse.data['accessToken'];
        final newRefresh = refreshResponse.data['refreshToken'];

        if (newAccess != null) {
          await localStorage.saveKey(StorageKey.accessToken, newAccess);
        }

        if (newRefresh != null) {
          await localStorage.saveKey(StorageKey.refreshToken, newRefresh);
        }

        return newAccess;
      }
    } catch (_) {}
    return null;
  }

  void _updateQueuedRequestsWithNewToken(String token) {
    for (final queued in _requestQueue) {
      queued.request.headers['Authorization'] = "Bearer $token";
      dio
          .fetch(queued.request)
          .then(queued.completer.complete)
          .catchError(queued.completer.completeError);
    }
    _requestQueue.clear();
  }

  bool _isAuthRefreshCall(DioError err) {
    return err.requestOptions.path.contains("/${ApiEndpoints.refreshToken}");
  }

  void _forceLogout() {
    Logger.log("Refresh failed → Logging out user...");
    
    //implement logout

    localStorage.clearAll();
  }
}

class _QueuedRequest {
  final RequestOptions request;
  final Completer<Response> completer;
  _QueuedRequest(this.request, this.completer);
}
