import 'package:aawash/core/constant/aawash_api.dart';
import 'package:aawash/core/constant/type_def.dart';
import 'package:aawash/core/failure/failure.dart';
import 'package:aawash/core/service/dio_service.dart/dio_service.dart';
import 'package:aawash/feature/authentication/model/otp_response/otp_response.dart';
import 'package:aawash/feature/authentication/model/otp_verified_response/otp_verified_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthService {
  FutureEither<OtpResponse> sendOTP(
    String identifier,
  );
  FutureEither<OtpVerifiedResponse> verifyOTP(
    String otpCode,
    String token,
  );
}

class AuthServiceImplementation extends AuthService {
  final DioService dioService;
  AuthServiceImplementation(this.dioService);

  @override
  FutureEither<OtpResponse> sendOTP(
    String identifier,
  ) async {
    try {
      final data = await dioService.postData(
        AawashApi.otpRequest,
        {
          "phone": "$identifier ",
        },
      );
      return right(
        OtpResponse.fromJson(
          data,
        ),
      );
    } catch (e) {
      return left(
        Failiure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  FutureEither<OtpVerifiedResponse> verifyOTP(
      String otpCode, String token) async {
    try {
      final data = await dioService.postData(
        AawashApi.otpSent,
        {
          " OTPCODE": otpCode,
          "token": token,
        },
      );

      return right(
        OtpVerifiedResponse.fromJson(data),
      );
    } catch (e) {
      return left(
        Failiure(
          message: e.toString(),
        ),
      );
    }
  }
}
