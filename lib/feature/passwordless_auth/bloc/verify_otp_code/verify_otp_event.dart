import 'package:equatable/equatable.dart';

sealed class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class VerifyOtpCodeEvent extends VerifyOtpEvent {
  final String message;
  final String token;

  const VerifyOtpCodeEvent(
    this.message,
    this.token,
  );
  @override
  List<Object?> get props => [
        message,
        token,
      ];
}
