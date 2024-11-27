import 'package:aawash/feature/authentication/screen/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      body: OtpVerificationScreen(),
    );
  }
}
