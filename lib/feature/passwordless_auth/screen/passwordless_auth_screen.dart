import 'package:flutter/material.dart';
import 'package:aawash/feature/passwordless_auth/widget/passwordless_auth_view.dart';

class PasswordLessAuthScreen extends StatefulWidget {
  const PasswordLessAuthScreen({super.key});
  static const String route = "passwordless_auth";

  @override
  State<PasswordLessAuthScreen> createState() => _PasswordLessAuthScreenState();
}

class _PasswordLessAuthScreenState extends State<PasswordLessAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PasswordLessAuthView(),
    );
  }
}
