import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_state.dart';
import 'package:aawash/feature/passwordless_auth/service/passwordless_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final PasswordLessAuthService passwordLessAuthService;
  VerifyOtpBloc(this.passwordLessAuthService)
      : super(
          VerifyOtpInitialState(),
        ) {
    on<VerifyOtpCodeEvent>(_verifyOtp);
  }

  void _verifyOtp(
    VerifyOtpCodeEvent event,
    Emitter<VerifyOtpState> emit,
  ) async {
    (VerifyOtpInitialState());
    final data = await passwordLessAuthService.verifyOTP(
      event.message,
      event.token,
    );
    data.fold(
      (failure) => emit(
        VerifyOtpFailureState(failure),
      ),
      (r) => emit(
        VerifyOtpSuccessState(
          r.message.toString(),
          r.token.toString(),
        ),
      ),
    );
  }
}
