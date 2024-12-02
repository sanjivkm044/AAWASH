import 'dart:math';

import 'package:aawash/core/constant/aawash_api.dart';
import 'package:aawash/core/constant/type_def.dart';
import 'package:aawash/core/failure/failure.dart';
import 'package:aawash/core/service/dio_service.dart/dio_service.dart';
import 'package:aawash/feature/passwordless_auth/model/otp_response/sent_otp_response.dart';
import 'package:aawash/feature/passwordless_auth/model/otp_verified_response/verify_otp_respnse.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PasswordLessAuthService {
  FutureEither<SentOtpResponseModel> sendOTP(
    String identifier,
  );
  FutureEither<VerifyOtpResponseModel> verifyOTP(
    String otpCode,
    String jwt,
  );
}

class PasswordLessAuthServiceImplementation extends PasswordLessAuthService {
  final DioService dioService;
  PasswordLessAuthServiceImplementation(
    this.dioService,
  );

  @override
  FutureEither<SentOtpResponseModel> sendOTP(
    String identifier,
  ) async {
    try {
      final data = await dioService.postData(
        AawashApi.otpRequest,
        {
          "identifier": identifier,
          "type": identifier.contains('@') ? "email" : "phone",
          "role": "USER"
        },
      );

      return right(
        SentOtpResponseModel.fromJson(
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
  FutureEither<VerifyOtpResponseModel> verifyOTP(
      String otpCode, String jwt) async {
    try {
      final data = await dioService.postData(
        AawashApi.otpSent,
        {
          " OTPCODE": otpCode,
          "token": jwt,
        },
      );

      return right(
        VerifyOtpResponseModel.fromJson(data),
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
