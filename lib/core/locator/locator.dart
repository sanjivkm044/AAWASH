import 'package:aawash/core/internet_status/internet_bloc.dart';
import 'package:aawash/core/service/dio_service.dart/dio_service.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_otp_code/send_otp_bloc.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_bloc.dart';
import 'package:aawash/feature/passwordless_auth/service/passwordless_auth_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );

  getIt.registerLazySingleton<DioService>(
    () => DioServiceImplementation(),
  );

  getIt.registerLazySingleton<PasswordLessAuthService>(
    () => PasswordLessAuthServiceImplementation(
      getIt<DioService>(),
    ),
  );

  // Other registrations...
  getIt.registerFactory<InternetBloc>(
    () => InternetBloc(
      getIt<Connectivity>(),
    ),
  );

  getIt.registerFactory<SendOtpBloc>(
    () => SendOtpBloc(
      getIt<PasswordLessAuthService>(),
    ),
  );

  getIt.registerFactory<VerifyOtpBloc>(
    () => VerifyOtpBloc(
      getIt<PasswordLessAuthService>(),
    ),
  );
}
