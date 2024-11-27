// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/form/form_builder_text_field.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:aawash/flavors.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            TextFormFieldBuilder(
              name: "Email",
              initialValue: "",
              hintText: "Email or Phone",
              labelText: "Email Or Phone ",
              validator: (value) {},
              onSubmitted: (value) {},
              textAlign: TextAlign.start,
            ),
            const SpacerWidget(),
            AawashPrimaryButton(
              text: "SIGN UP",
              onPressed: () {
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
    );
  
  
  }
}
