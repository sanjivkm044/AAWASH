import 'package:equatable/equatable.dart';

sealed class SendOtpEvent extends Equatable {
  const SendOtpEvent();
}

class SendOtpCodeEvent extends SendOtpEvent {
  final String identifier;

  const SendOtpCodeEvent(
    this.identifier,
  );
  @override
  List<Object?> get props => [
        identifier,
      ];
}
