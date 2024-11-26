import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aawash/feature/authentication/widget/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String route = "splashScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld),
        ),
      ),
      body: const LoginWidget(),
    );
  }
}
