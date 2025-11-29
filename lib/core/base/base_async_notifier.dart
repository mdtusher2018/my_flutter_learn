import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/core/utils/logger.dart';

abstract class BaseAsyncNotifier<T> extends StateNotifier<AsyncValue<T?>> {
  final IApiService apiService;
  final ISnackBarService snackBarService;

  BaseAsyncNotifier(this.apiService, this.snackBarService)
    : super(const AsyncValue.data(null));

  Future<void> execute(
    Future<T> Function() task, {
    bool showLoading = true,
    bool showSuccess = false,
    String? successMessage,
    bool showError = true,
  }) async {
    if (showLoading) state = const AsyncValue.loading();

    try {
      final result = await task();
      state = AsyncValue.data(result);

      if (showSuccess && successMessage != null) {
        snackBarService.showSuccess(successMessage);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      AppLogger.error(e.toString());
      // if (showError) {
      //   snackBarService.showError(e.toString());
      // }
    }
    // finally {
    //   // Optional: You can reset loading manually or leave as is
    //   if (showLoading) {
    //     // Keeps the state as data/error, no explicit reset needed
    //   }
    // }
  }
}
