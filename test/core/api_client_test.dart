import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template/core/error/api_exception.dart';
import 'package:template/core/services/network/api_client.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';

class MockDio extends Mock implements Dio {}

class MockLocalStorage extends Mock implements ILocalStorageService {}

void main() {
  late ApiClient client;
  late MockDio mockDio;
  late Interceptors interceptors;
  late MockLocalStorage mockStorage;

  setUp(() {
    mockDio = MockDio();
    mockStorage = MockLocalStorage();
    interceptors = Interceptors();
    when(() => mockDio.interceptors).thenReturn(interceptors);

    client = ApiClient(
      dio: mockDio, // inject mock
      baseUrl: ApiEndpoints.baseImageUrl,
      localStorage: mockStorage,
    );
  });

  Response mockResponse(int status, dynamic data) {
    return Response(
      statusCode: status,
      data: data,
      requestOptions: RequestOptions(path: "/"),
    );
  }

  group("_processResponse", () {
    test("returns data when statusCode is 200", () async {
      final mockRes = mockResponse(200, {"ok": true});

      when(
        () => mockDio.get(any(), options: any(named: "options")),
      ).thenAnswer((_) async => mockRes);

      final result = await client.get(Uri.parse(ApiEndpoints.baseImageUrl));

      expect(result, {"ok": true});
    });

    test("throws ApiException with server message", () async {
      final mockRes = mockResponse(400, {"message": "Bad request"});

      when(
        () => mockDio.get(any(), options: any(named: "options")),
      ).thenAnswer((_) async => mockRes);

      expect(
        () => client.get(Uri.parse(ApiEndpoints.baseImageUrl)),
        throwsA(
          isA<ApiException>()
              .having((e) => e.message, "message", "Bad request")
              .having((e) => e.statusCode, "status", 400),
        ),
      );
    });

    test(
      "throws ApiException with 'Unknown error' when message missing",
      () async {
        final mockRes = mockResponse(500, {"detail": "not message"});

        when(
          () => mockDio.get(any(), options: any(named: "options")),
        ).thenAnswer((_) async => mockRes);

        expect(
          () => client.get(Uri.parse(ApiEndpoints.baseImageUrl)),
          throwsA(
            isA<ApiException>().having(
              (e) => e.message,
              "message",
              "Unknown error",
            ),
          ),
        );
      },
    );

    test("throws ApiException when data is not map", () async {
      final mockRes = mockResponse(400, "string error");

      when(
        () => mockDio.get(any(), options: any(named: "options")),
      ).thenAnswer((_) async => mockRes);

      expect(
        () => client.get(Uri.parse(ApiEndpoints.baseImageUrl)),
        throwsA(
          isA<ApiException>().having(
            (e) => e.message,
            "message",
            "Unknown error",
          ),
        ),
      );
    });
  });
}
