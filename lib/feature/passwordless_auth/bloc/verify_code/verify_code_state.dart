import 'package:aawash/core/failure/failure.dart';

sealed class VerifyCodeState {}

class VerifyCodeInitialState extends VerifyCodeState {}

class VerifyCodeRequestingState extends VerifyCodeState {}

// class VerifyCodeSentState extends VerifyCodeState {
//   final VerifyOtpResponseModel verifyOtpResponseModel;
//   VerifyCodeSentState(this.verifyOtpResponseModel);
// }

class VerifyCodeSuccessState extends VerifyCodeState {
  String message;
  String token;
  VerifyCodeSuccessState(this.message, this.token);
}


class VerifyCodeFailureState extends VerifyCodeState {
  final Failiure failiure;
  VerifyCodeFailureState(this.failiure);
}
