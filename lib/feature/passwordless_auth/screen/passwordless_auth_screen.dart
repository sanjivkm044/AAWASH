import 'package:aawash/core/locator/locator.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_otp_code/send_otp_bloc.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aawash/feature/passwordless_auth/widget/passwordless_auth_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordLessAuthScreen extends StatefulWidget {
  const PasswordLessAuthScreen({super.key});
  static const String route = "passwordless_auth";

  @override
  State<PasswordLessAuthScreen> createState() => _PasswordLessAuthScreenState();
}

class _PasswordLessAuthScreenState extends State<PasswordLessAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SendOtpBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<VerifyOtpBloc>(),
        ),
      ],
      child: const Scaffold(
        body: PasswordLessAuthView(),
      ),
    );
  }
}
