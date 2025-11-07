import 'package:template/features/authentication/data/models/base_api_response.dart';

class LoginResponse extends BaseResponse {
  final String? token;
  final String? userId;

  LoginResponse({
    required bool success,
    required int statusCode,
    String? message,

    this.token,
    this.userId,
  }) : super(success: success, message: message, statusCode: statusCode);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'],
      statusCode: json['statusCode'],
      token: json['data']?['token'],
      userId: json['data']?['user_id'],
    );
  }
}
