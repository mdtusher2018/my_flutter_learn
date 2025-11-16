import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/authentication/data/models/email_verified_response.dart';
import 'package:template/features/authentication/data/models/forgot_password_response.dart';
import 'package:template/features/authentication/data/models/otp_verified_response.dart';
import 'package:template/features/authentication/data/models/signin_response.dart';
import 'package:template/features/authentication/data/models/signup_response.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IApiService api;
  AuthRepository(this.api);

  @override
  Future<SigninResponse> login(String email, String password) async {
    final res = await api.post(ApiEndpoints.signin, {
      "email": email,
      "password": password,
    });

    return SigninResponse.fromJson(res);
  }

  @override
  Future<SignupResponse> signup(String email, String password) async {
    final res = await api.post(ApiEndpoints.signup, {
      "email": email,
      "password": password,
      "name": "John Doe",
      "phoneNumber": "+8801646456527",
      "registerWith": "credentials",
    });
    return SignupResponse.fromJson(res);
  }

  @override
  Future<EmailVerifiedResponse> emailVerification(String otp) async {
    final res = await api.post(ApiEndpoints.emailVerification, {
      "otp": otp,
      "purpose": "email-verification",
    });

    return EmailVerifiedResponse.fromJson(res);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    final res = await api.patch(ApiEndpoints.forgetPassword, {'email': email});
    return ForgotPasswordResponse.fromJson(res);
  }

  @override
  Future<OtpVerifiedResponse> otpVerification(String otp) async {
    final res = await api.post(ApiEndpoints.verifyOTP, {
      "otp": otp,
      "purpose": "forget-password",
    });

    return OtpVerifiedResponse.fromJson(res);
  }
}
