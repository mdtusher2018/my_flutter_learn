// lib/core/network/interceptors/refresh_token_interceptor.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage _secure = const FlutterSecureStorage();
  bool _isRefreshing = false;
  final List<QueuedRequest> _queue = [];

  RefreshTokenInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final res = err.response;
    if (res?.statusCode == 401) {
      final rOptions = err.requestOptions;

      // If already refreshing, queue the request
      if (_isRefreshing) {
        final p = Completer<Response>();
        _queue.add(QueuedRequest(rOptions, p));
        return handler.resolve(await p.future);
      }

      _isRefreshing = true;
      try {
        final refreshToken = await _secure.read(key: 'refreshToken');
        if (refreshToken == null) {
          _isRefreshing = false;
          return handler.next(err); // let app handle logout
        }

        // call refresh endpoint (use a new Dio instance to avoid infinite loop)
        final refreshDio = Dio();
        final refreshRes = await refreshDio.post(
          '${dio.options.baseUrl}/auth/refresh', // adapt
          data: {'refreshToken': refreshToken},
        );

        if (refreshRes.statusCode == 200) {
          final newAccess = refreshRes.data['accessToken'];
          final newRefresh = refreshRes.data['refreshToken'];
          await _secure.write(key: 'authToken', value: newAccess);
          if (newRefresh != null) await _secure.write(key: 'refreshToken', value: newRefresh);

          // replay original request with new token
          rOptions.headers['Authorization'] = 'Bearer $newAccess';
          final retryResponse = await dio.fetch(rOptions);

          // resolve queued requests
          for (final q in _queue) {
            q.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
            dio.fetch(q.requestOptions).then((resp) => q.completer.complete(resp)).catchError((e) => q.completer.completeError(e));
          }
          _queue.clear();

          handler.resolve(retryResponse);
        } else {
          // refresh failed -> clear queue and let app log out
          for (final q in _queue) q.completer.completeError(err);
          _queue.clear();
          handler.next(err);
        }
      } catch (e) {
        for (final q in _queue) q.completer.completeError(e);
        _queue.clear();
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }
      return;
    }
    return handler.next(err);
  }
}

class QueuedRequest {
  final RequestOptions requestOptions;
  final Completer<Response> completer;
  QueuedRequest(this.requestOptions, this.completer);
}
