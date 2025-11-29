import 'package:template/core/base/failure.dart';
import 'package:template/core/base/repository.dart';
import 'package:template/core/base/result.dart';
import 'package:template/features/authentication/data/models/email_verification/email_verified_response.dart';
import 'package:template/features/authentication/data/models/forgot_password_response.dart';
import 'package:template/features/authentication/data/models/otp_verified_response.dart';
import 'package:template/features/authentication/data/models/sign_in/signin_response.dart';
import 'package:template/features/authentication/data/models/sign_up/signup_response.dart';

abstract base class IAuthRepository extends Repository {
  Future<Result<SigninResponse, Failure>> login(String email, String password);
  Future<Result<SignupResponse, Failure>> signup(String email, String password);
  Future<Result<EmailVerifiedResponse, Failure>> emailVerification(String otp);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<OtpVerifiedResponse> otpVerification(String otp);
}
