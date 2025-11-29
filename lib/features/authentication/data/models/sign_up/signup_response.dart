import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response.freezed.dart';
part 'signup_response.g.dart';

@freezed
abstract class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required String status,
    required int statusCode,
    required String message,
    required SignupData data,
    @Default([]) List<dynamic> errors,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@freezed
abstract class SignupData with _$SignupData {
  const factory SignupData({
    @Default('user') String type,
    required String signUpToken,
  }) = _SignupData;
  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);
}
