class SignupResponse {
  final String status;
  final int statusCode;
  final String message;
  final Data? data;
  final List<dynamic> errors;

  SignupResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
    required this.errors,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'] ?? "",
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: Data.fromJson(json['data'] ?? {}),
      errors: json['errors'] ?? [],
    );
  }
}

class Data {
  final String signUpToken;

  Data({required this.signUpToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(signUpToken: json['otpToken']?["token"] as String);
  }
}
