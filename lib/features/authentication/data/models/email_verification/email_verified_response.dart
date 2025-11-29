import 'package:freezed_annotation/freezed_annotation.dart';
part 'email_verified_response.freezed.dart';
part 'email_verified_response.g.dart';

@freezed
abstract class EmailVerifiedResponse with _$EmailVerifiedResponse {
  const factory EmailVerifiedResponse({
    required String status,
    required int statusCode,
    required String message,
    required EmailVerifiedData data,
    @Default([]) List<dynamic> errors,
  }) = _EmailVerifiedResponse;

  factory EmailVerifiedResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifiedResponseFromJson(json);
}

@freezed
abstract class EmailVerifiedData with _$EmailVerifiedData {
  const factory EmailVerifiedData({
    @Default('user') String type,
    required String accessToken,
  }) = _EmailVerifiedData;
  factory EmailVerifiedData.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifiedDataFromJson(json);
}
