import 'package:flutter/material.dart';
import 'package:aawash/feature/authentication/widget/sign_up_view.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String route = "signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupView(),
    );
  }
}
