import 'package:aawash/core/failure/failure.dart';

sealed class VerifyOtpState {}

class VerifyOtpInitialState extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

// class VerifyCodeSentState extends VerifyOtpState {
//   final VerifyOtpResponseModel verifyOtpResponseModel;
//   VerifyCodeSentState(this.verifyOtpResponseModel);
// }

class VerifyOtpSuccessState extends VerifyOtpState {
  String message;
  String token;
  VerifyOtpSuccessState(
    this.message,
    this.token,
  );
}

class VerifyOtpFailureState extends VerifyOtpState {
  final Failiure failiure;
  VerifyOtpFailureState(this.failiure);
}
