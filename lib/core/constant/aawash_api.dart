abstract class AawashApi {
  static const String baseUrl = 'http://192.168.0.102:4000/';

  //PasswordLess Auth
  static const String otpRequest = 'auth/send-otp';
  static const String otpSent = 'auth/verify-otp';
}
