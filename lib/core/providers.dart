import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/network/api_client.dart';
import 'package:template/core/network/api_service.dart';
import 'package:template/core/network/i_api_service.dart';
import 'package:template/core/storage/i_local_storage_service.dart';
import 'package:template/core/storage/local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';

// Provider for LocalStorageService singleton
final localStorageProvider = Provider<ILocalStorageService>((ref) {
  final service = LocalStorageService();
  return service;
});

// Provide ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl: ApiEndpoints.baseUrl);
});

// Provide ApiService
final apiServiceProvider = Provider<IApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return ApiService(client, baseUrl: ApiEndpoints.baseUrl);
});
