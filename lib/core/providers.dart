import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/services/network/api_client.dart';
import 'package:template/core/services/network/api_service.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';

// Provider for LocalStorageService singleton
final localStorageProvider = Provider<ILocalStorageService>((ref) {
  final service = LocalStorageService();
  return service;
});

// Provide ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  final localService = ref.watch(localStorageProvider);
  return ApiClient(baseUrl: ApiEndpoints.baseUrl, localStorage: localService);
});

// Provide ApiService
final apiServiceProvider = Provider<IApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return ApiService(client, baseUrl: ApiEndpoints.baseUrl);
});


// Provide SnackbarService
final snackBarServiceProvider = Provider<ISnackBarService>((ref) {
  return SnackBarService();
});



