import 'package:aawash/feature/passwordless_auth/bloc/send_verification_code/send_verification_code_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_verification_code/send_verification_code_state.dart';
import 'package:aawash/feature/passwordless_auth/service/passwordless_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendVerificationCodeBloc
    extends Bloc<SendVerificationCodeEvent, SendVerificationCodeState> {
  final PasswordLessAuthService passwordLessAuthService;
  SendVerificationCodeBloc(
    this.passwordLessAuthService,
  ) : super(RequestingSendVerificationCodeState()) {
    on<OtpSendEvent>(_otpsent);
  }

  Future<void> _otpsent(
      OtpSendEvent event, Emitter<SendVerificationCodeState> emit) async {
    emit(RequestingSendVerificationCodeState());

    final result = await passwordLessAuthService.sendOTP(event.identifier);
    result.fold(
      (failure) => emit(FailedSendVerificationCodeState(failure)),
      (onSuccess) => emit(
        SuccessSendVerificationCodeState(onSuccess),
      ),
    );
  }
}
