import 'package:equatable/equatable.dart';

sealed class VerifyCodeEvent extends Equatable {
  const VerifyCodeEvent();
}

class OtpVerifyEvent extends VerifyCodeEvent {
  final String message;
  final String token;

  const OtpVerifyEvent(
    this.message,
    this.token,
  );
  @override
  List<Object?> get props => [message, token,];
}
