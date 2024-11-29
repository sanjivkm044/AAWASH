

import 'package:aawash/core/failure/failure.dart';
import 'package:aawash/feature/authentication/model/otp_response/otp_response.dart';
import 'package:aawash/feature/authentication/model/otp_verified_response/user.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class OtpRequestingState extends LoginState {}

class OtpRequestedState extends LoginState {
  final OtpResponse otpResponse;
  OtpRequestedState(this.otpResponse);
}

class OtpRequestFailedState extends LoginState {
  final Failiure failiure;
  OtpRequestFailedState(this.failiure);
}

class OtpVerifyingState extends LoginState {}

class OtpVerifiedState extends LoginState {
  String? message;
  User? user;
  String? token;
  OtpVerifiedState(this.message, this.token, this.user);
}

class OtpVerificationFailedState extends LoginState {
  final Failiure failiure;
  OtpVerificationFailedState(this.failiure);
}
