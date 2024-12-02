import 'package:aawash/feature/passwordless_auth/model/otp_verified_response/user_response.dart';

class VerifyOtpResponseModel {
  String? message;
  UserResponseModel? user;
  String? token;

  VerifyOtpResponseModel({required this.message, required this.user, required this.token});

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;

    data['user'] = user;

    data['token'] = token;
    return data;
  }
}
