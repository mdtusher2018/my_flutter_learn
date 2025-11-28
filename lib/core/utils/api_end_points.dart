class ApiEndpoints {
  static String mapKey = "AIzaSyBuSZJklSc1j0D4kqhkJcmyArcZbWujbXQ";

  // static String mapResturant(String resturantName)=>"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$resturantName&types=establishment&key=$mapKey";
  static String mapResturant(String resturantName) =>
      "https://places.googleapis.com/v1/places:searchText?query=$resturantName&key=$mapKey";

  static const String baseUrl = 'http://147.93.29.184:8020/api/v1/';
  static const String baseImageUrl = 'http://147.93.29.184:8020';

  // static const String baseUrl = 'http://103.186.20.117:6136/api/v1/';
  // static const String baseImageUrl = 'http://103.186.20.117:6136';

  static String refreshToken = "auth/refresh-token";

  //authentication
  static String signin = "auth/signin";

  static String signup = "users";

  static String emailVerification = "auth/verify-email";
  static String resendOTP = "auth/resend-otp";

  static String forgetPassword = "auth/forgot-password";
  static String verifyOTP = "auth/verify-otp";
}
