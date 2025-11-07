class BaseResponse {
  final bool success;
  final int statusCode;
  final String? message;

  BaseResponse({required this.success, this.message, required this.statusCode});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'],
    );
  }
}
