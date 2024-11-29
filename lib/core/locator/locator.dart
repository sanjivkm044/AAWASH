import 'package:aawash/core/internet_status/internet_bloc.dart';
import 'package:aawash/core/service/dio_service.dart/dio_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Other registrations...
  getIt
      .registerFactory<InternetBloc>(() => InternetBloc(getIt<Connectivity>()));

  getIt.registerLazySingleton<DioService>(
    () => DioServiceImplementation(),
  );
}
