// lib/core/network/api_client.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/error/api_exception.dart';
import 'package:template/core/services/network/interceptor.dart/auth_interceptor.dart';
import 'package:template/core/services/network/interceptor.dart/logger_interceptor.dart';
import 'package:template/core/services/network/interceptor.dart/refresh_token_interceptor.dart';
import 'package:template/core/services/network/interceptor.dart/retry_interceptor.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';

class ApiClient {
  final Dio dio; 
  final ILocalStorageService localStorage;

  ApiClient({
    Dio? dio,
    required String baseUrl,
    required this.localStorage,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 15),
  }) : dio = dio ??
            Dio(BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: connectTimeout,
              receiveTimeout: receiveTimeout,
              headers: {HttpHeaders.contentTypeHeader: 'application/json'},
              validateStatus: (_) => true,
            )) {
    // add interceptors
    this.dio.interceptors.add(AuthInterceptor(localStorage));
    this.dio.interceptors.add(RefreshTokenInterceptor(this.dio,localStorage));
    this.dio.interceptors.add(RetryOnConnectionChangeInterceptor(dio: this.dio));
    this.dio.interceptors.add(LoggingInterceptor());
  }

  Future<dynamic> get(Uri url, {Map<String, String>? headers}) async {
    final res = await dio.get(url.toString(), options: Options(headers: headers));
    return _processResponse(res);
  }

  Future<dynamic> post(Uri url, {Map<String, String>? headers, dynamic body}) async {
    final res = await dio.post(url.toString(), data: body, options: Options(headers: headers));
    return _processResponse(res);
  }

  Future<dynamic> put(Uri url, {Map<String, String>? headers, dynamic body}) async {
    final res = await dio.put(url.toString(), data: body, options: Options(headers: headers));
    return _processResponse(res);
  }

  Future<dynamic> patch(Uri url, {Map<String, String>? headers, dynamic body}) async {
    final res = await dio.patch(url.toString(), data: body, options: Options(headers: headers));
    return _processResponse(res);
  }

  Future<dynamic> delete(Uri url, {Map<String, String>? headers, dynamic body}) async {
    final res = await dio.delete(url.toString(), data: body, options: Options(headers: headers));
    return _processResponse(res);
  }

  Future<dynamic> sendMultipart(Uri url, {String method = 'POST', Map<String, String>? headers, Map<String, File>? files, dynamic body, String bodyFieldName = 'data'}) async {
    final form = FormData();
    if (body != null) {
      if (body is Map) {
        body.forEach((k, v) => form.fields.add(MapEntry(k, v.toString())));
      } else {
        form.fields.add(MapEntry(bodyFieldName, body.toString()));
      }
    }
    if (files != null) {
      for (final e in files.entries) {
        form.files.add(MapEntry(
          e.key,
          await MultipartFile.fromFile(e.value.path, filename: e.value.path.split('/').last),
        ));
      }
    }
    final res = await dio.request(url.toString(), data: form, options: Options(method: method, headers: headers));
    return _processResponse(res);
  }

  dynamic _processResponse(Response r) {
    // global unauthorized handled in interceptors, but re-check
    if (r.statusCode == 401) {
      // optional fallback
    }

    final statusCode = r.statusCode ?? 0;
    final data = r.data;

    Logger.log('API RESPONSE: ${r.requestOptions.uri} -> $statusCode : $data');

    if (statusCode >= 200 && statusCode < 300) return data;

    final message = data is Map && data['message'] != null ? data['message'] as String : 'Unknown error';
    throw ApiException(statusCode, message, data: data);
  }
}
