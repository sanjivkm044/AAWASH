import 'dart:async';
import 'dart:developer';

import 'package:aawash/aawash_app.dart';
import 'package:aawash/core/utils/aawash_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = const AawashBlocObserver();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );

    runApp(const AawashApp());
  }, (error, strace) {
    log("Error on RunZoned  : $error ");
  });
}


