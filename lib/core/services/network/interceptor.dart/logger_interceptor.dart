import 'package:dio/dio.dart';
import '../../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.log(
      '➡️ Request: [${options.method}] ${options.uri} \nHeaders: ${options.headers} \nData: ${options.data}',
      tag: 'DIO',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.log(
      '✅ Response: [${response.statusCode}] ${response.requestOptions.uri} \nData: ${response.data}',
      tag: 'DIO',
    );
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.error(
      '❌ Error: [${err.response?.statusCode}] ${err.requestOptions.uri} \nMessage: ${err.message}',
      tag: 'DIO',
    );
    handler.next(err);
  }
}
