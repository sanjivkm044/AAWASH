import 'package:aawash/feature/authentication/model/otp_verified_response/user.dart';

class OtpVerifiedResponse {
  String? message;
  User? user;
  String? token;

  OtpVerifiedResponse({required this.message, required this.user, required this.token});

  OtpVerifiedResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;

    data['user'] = user;

    data['token'] = token;
    return data;
  }
}
