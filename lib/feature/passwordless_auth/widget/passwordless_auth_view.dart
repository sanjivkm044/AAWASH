// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/form/form_builder_text_field.dart';
import 'package:aawash/core/locator/locator.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_verification_code/send_verification_code_bloc.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_verification_code/send_verification_code_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/send_verification_code/send_verification_code_state.dart';
import 'package:aawash/feature/passwordless_auth/screen/otp_verification_screen.dart';
import 'package:aawash/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class PasswordLessAuthView extends StatefulWidget {
  const PasswordLessAuthView({
    super.key,
  });

  @override
  State<PasswordLessAuthView> createState() => _PasswordLessAuthViewState();
}

class _PasswordLessAuthViewState extends State<PasswordLessAuthView> {
  final TextEditingController identifierController = TextEditingController();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final SendVerificationCodeBloc sendVerificationCodeBloc =
      getIt<SendVerificationCodeBloc>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: PaddingConstant.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpacerWidget(
                height: 200,
              ),
              Text(
                F.title,
                style: AawashTextStyle.aawashTitle,
              ),
              const SpacerWidget(
                height: 40,
              ),
              BlocConsumer<SendVerificationCodeBloc, SendVerificationCodeState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                bloc: sendVerificationCodeBloc,
                builder: (context, state) {
                  return TextFormFieldBuilder(
                    controller: identifierController,
                    name: "Email",
                    hintText: "Email or Phone",
                    labelText: "Email Or Phone ",
                    validator: (value) {},
                    onSubmitted: (value) {
                      OtpSendEvent(value!);
                    },
                    textAlign: TextAlign.start,
                  );
                },
              ),
              const SpacerWidget(),
              AawashPrimaryButton(
                text: "SIGN UP",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final data = _formKey.currentState!.value;
                    log(data.toString());
                    sendVerificationCodeBloc.add(
                      OtpSendEvent(identifierController.text),
                    );
                  }
                  context.goNamed(OtpVerificationScreen.route);
                  log(" Sign Up Button Pressed!");
                },
                color: Colors.black,
              ),
              const SpacerWidget(
                height: 230,
              ),
              const Text(
                "By continuing I agree to accept the Privacy \n Policy & terms of Service of Aawash",
                style: AawashTextStyle.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
