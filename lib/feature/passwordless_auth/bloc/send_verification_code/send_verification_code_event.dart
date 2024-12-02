import 'package:equatable/equatable.dart';


sealed class SendVerificationCodeEvent  extends Equatable{
 const  SendVerificationCodeEvent();
}



class OtpSendEvent extends SendVerificationCodeEvent {
  final String identifier;

  const OtpSendEvent(
    this.identifier,
  );
  @override
  List<Object?> get props => [
        identifier,
      ];
}
