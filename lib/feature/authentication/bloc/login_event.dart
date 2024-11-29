import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class OtpRequestEvent extends LoginEvent {
  final String identifier;

  const OtpRequestEvent(
    this.identifier,
  );
  @override
  List<Object?> get props => [identifier, ];
}

class OtpVerifyEvent extends LoginEvent {
  final String token;
  final String otpCode;

  const OtpVerifyEvent(
    this.otpCode,
    this.token,
  );
  @override
  List<Object?> get props => [otpCode, token];
}
