import 'package:aawash/core/failure/failure.dart';
import 'package:aawash/feature/passwordless_auth/model/otp_response/sent_otp_response.dart';

sealed class SendOtpState {}

class SendOtpInitialState extends SendOtpState {}

class SendOtpLoadingState extends SendOtpState {}

class SendOtpSuccessState extends SendOtpState {
  final SentOtpResponseModel sentOtpResponseModel;
  SendOtpSuccessState(
    this.sentOtpResponseModel,
  );
}

class SendOtpFailureState extends SendOtpState {
  final Failiure failiure;
  SendOtpFailureState(this.failiure);
}
