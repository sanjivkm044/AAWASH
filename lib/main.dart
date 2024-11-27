// import 'dart:async';
// import 'package:aawash/aawash_app.dart';
// import 'package:flutter/material.dart';

// FutureOr<void> main() async {
//   runApp(const AawashApp());
// }

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:aawash/aawash_app.dart';
import 'package:aawash/core/locator/locator.dart';
import 'package:aawash/core/service/dio_service.dart/dio_service.dart';
import 'package:aawash/core/utils/aawash_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = const AawashBlocObserver();
    await setup();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    HttpOverrides.global = MyHttpOverrides();
    await getIt.allReady();
    runApp(const AawashApp());
  }, (error, strace) {
    log("Error on RunZoned  : $error ");
  });
}
