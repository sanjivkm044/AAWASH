import 'package:aawash/feature/authentication/screen/otp_verification_screen.dart';
import 'package:aawash/feature/authentication/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AawashRoute {
  static final GlobalKey<NavigatorState> rootNavigationKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellRouteKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/${SignupScreen.route}',
    routes: [
     
       GoRoute(
        path: '/${SignupScreen.route}',
        name: SignupScreen.route,
        builder: (context, state) => const SignupScreen(),
      ),
       GoRoute(
        path: '/${OtpVerificationScreen.route}',
        name: OtpVerificationScreen.route,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
    ],
  );
}
