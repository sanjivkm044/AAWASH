
import 'package:aawash/feature/passwordless_auth/bloc/verify_code/verify_code_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_code/verify_code_state.dart';
import 'package:aawash/feature/passwordless_auth/service/passwordless_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  final PasswordLessAuthService passwordLessAuthService;
  VerifyCodeBloc(this.passwordLessAuthService)
      : super(
          VerifyCodeInitialState(),
        ) {
    on<OtpVerifyEvent>(verifyOtpverify);
  }

  void verifyOtpverify(
    OtpVerifyEvent event,
    Emitter<VerifyCodeState> emit,
  ) async {
    (VerifyCodeInitialState());
    final data = await passwordLessAuthService.verifyOTP(
      event.message,
      event.token,
    );
    data.fold(
      (failure) => emit(
        VerifyCodeFailureState(failure),
      ),
      (r) => emit(
        VerifyCodeSuccessState(
          r.message.toString(),
          r.token.toString(),
        ),
      ),
    );
  }
}
