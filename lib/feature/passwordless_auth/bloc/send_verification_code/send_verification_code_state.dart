import 'package:aawash/core/failure/failure.dart';
import 'package:aawash/feature/passwordless_auth/model/otp_response/sent_otp_response.dart';

sealed class SendVerificationCodeState {}

class SendVerificationCodeInitialState extends SendVerificationCodeState {}

class RequestingSendVerificationCodeState extends SendVerificationCodeState {}

class SuccessSendVerificationCodeState extends SendVerificationCodeState {
  final SentOtpResponseModel sentOtpResponseModel;
  SuccessSendVerificationCodeState(
    this.sentOtpResponseModel,
  );
}

class FailedSendVerificationCodeState extends SendVerificationCodeState {
  final Failiure failiure;
  FailedSendVerificationCodeState(this.failiure);
}
