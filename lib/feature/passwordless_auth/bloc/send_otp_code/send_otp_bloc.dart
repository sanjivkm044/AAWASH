import 'package:aawash/feature/passwordless_auth/bloc/send_otp_code/send_otp_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_otp_code/send_otp_state.dart';
import 'package:aawash/feature/passwordless_auth/service/passwordless_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final PasswordLessAuthService passwordLessAuthService;
  SendOtpBloc(
    this.passwordLessAuthService,
  ) : super(SendOtpInitialState()) {
    on<SendOtpCodeEvent>(_sentOtp);
  }

  Future<void> _sentOtp(
      SendOtpCodeEvent event, Emitter<SendOtpState> emit) async {
    emit(SendOtpInitialState());

    final result = await passwordLessAuthService.sendOTP(event.identifier);
    result.fold(
      (failure) => emit(SendOtpFailureState(failure)),
      (onSuccess) => emit(
        SendOtpSuccessState(onSuccess),
      ),
    );
  }
}
