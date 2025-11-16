class ForgotPasswordResponse {
  final String status;
  final int statusCode;
  final String message;
  final ForgotPasswordData data;
  final List<String> errors;

  ForgotPasswordResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  // Factory method to parse JSON into a ForgotPasswordResponse object
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      status: json['status'] ?? "",
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: ForgotPasswordData.fromJson(json['data'] ?? {}),
      errors: List<String>.from(json['errors'] ?? []),
    );
  }
}

class ForgotPasswordData {
  final String type;
  final String token;

  ForgotPasswordData({required this.type, required this.token});

  // Factory method to parse JSON into a ForgotPasswordData object
  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordData(type: json['email'], token: json['token']);
  }

  // Method to convert ForgotPasswordData object into JSON
}
