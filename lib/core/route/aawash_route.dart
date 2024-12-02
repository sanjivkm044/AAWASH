import 'package:aawash/feature/passwordless_auth/screen/otp_verification_screen.dart';
import 'package:aawash/feature/passwordless_auth/screen/rent_or_buy_screen.dart';
import 'package:aawash/feature/passwordless_auth/screen/passwordless_auth_screen.dart';
import 'package:aawash/feature/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AawashRoute {
  static final GlobalKey<NavigatorState> rootNavigationKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellRouteKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/${PasswordLessAuthScreen.route}',
    routes: [
      GoRoute(
        path: '/${PasswordLessAuthScreen.route}',
        name: PasswordLessAuthScreen.route,
        builder: (context, state) => const PasswordLessAuthScreen(),
      ),
      GoRoute(
        path: '/${OtpVerificationScreen.route}',
        name: OtpVerificationScreen.route,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: '/${BuyOrRentScreen.route}',
        name: BuyOrRentScreen.route,
        builder: (context, state) => const BuyOrRentScreen(),
      ),
      GoRoute(
        path: '/${DashboardScreen.route}',
        name: DashboardScreen.route,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}
