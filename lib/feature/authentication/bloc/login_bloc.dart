import 'package:aawash/feature/authentication/bloc/login_event.dart';
import 'package:aawash/feature/authentication/bloc/login_state.dart';
import 'package:aawash/feature/authentication/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;
  LoginBloc(this.authService) : super(InitialState()) {
    on<OtpRequestEvent>(sendOtpRequest);
    on<OtpVerifyEvent>(verifyOtpverify);
  }

  Future<void> sendOtpRequest(
      OtpRequestEvent event, Emitter<LoginState> emit) async {
    emit(OtpRequestingState());

    final result = await authService.sendOTP(
      event.identifier,
    );
    result.fold(
      (failure) => emit(OtpRequestFailedState(failure)),
      (onSuccess) => emit(
        OtpRequestedState(onSuccess),
      ),
    );
  }

  void verifyOtpverify(
    OtpVerifyEvent event,
    Emitter<LoginState> emit,
  ) async {
    (OtpVerifyingState());
    final data = await authService.verifyOTP(
      event.otpCode,
      event.token,
    );
    data.fold(
      (failure) => emit(
        OtpVerificationFailedState(failure),
      ),
      (r) => emit(
        OtpVerifiedState(
          r.message,
          r.token,
          r.user,
        ),
      ),
    );
  }
}
