import 'package:aawash/feature/authentication/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AawashRoute {
  static final GlobalKey<NavigatorState> rootNavigationKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellRouteKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/${LoginScreen.route}',
    routes: [
      GoRoute(
        path: '/${LoginScreen.route}',
        name: LoginScreen.route,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
